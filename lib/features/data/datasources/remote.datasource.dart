import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:movie_locator_app/features/data/models/theater.model.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';
import 'package:movie_locator_app/features/domain/usecases/addTheater.usecase.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:movie_locator_app/features/data/models/booking.model.dart';
import 'package:movie_locator_app/features/domain/entities/booking.entity.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';

import '../../../core/error/exception.dart';
import '../models/MovieList.model.dart';
import '../models/movie.model.dart';

abstract class RemoteDataSource {
  Future<MovieListModel> getMovieList();
  Future<BookingModel> addBooking(BookingEntity entity);
  Future<MovieModel> saveUrl(MovieModel movieModel);
  Future<MovieModel> uploadMovie(MovieModel movieModel);
  Future<TheaterModel> addTheater(TheaterEntity entity);
  Future<BookingModel> getBookingFromRef(String ref);
  Future<BookingModel> updateBooking(BookingEntity entity);
  Future<BookingModel> deleteBooking(BookingEntity entity);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  StreamSubscription<QuerySnapshot>? subscription;
  List<DocumentSnapshot>? movieList;
  MovieListModel? movieListModel;

  @override
  Future<MovieModel> saveUrl(MovieModel movieModel) {
    CollectionReference refs = FirebaseFirestore.instance.collection('movies');

    return refs
        .add({
          'url': movieModel.movieImage, // John Doe
        })
        .then((value) => movieModel)
        .catchError((error) => ServerException());
  }

  @override
  Future<MovieModel> uploadMovie(MovieModel movieModel) async {
    final _imageName = movieModel.movieImage;
    final _storage = FirebaseStorage.instance;
    var downloadUrl;
    //Check permission

    if (movieModel.movieImage != null) {
      var file = File(movieModel.movieImage);
      //Upload to fire base
      var snapshot =
          await _storage.ref().child('movieImages/$_imageName').putFile(file);

      downloadUrl = await snapshot.ref.getDownloadURL();

      return MovieModel(
        movieImage: downloadUrl,
        movieDescription: '',
        movieName: '',
        theaterList: [],
      );
    } else {
      print('No path Received');
      throw ServerException();
    }
  }

  @override
  Future<MovieListModel> getMovieList() async {
    CollectionReference collectionReference =
        await FirebaseFirestore.instance.collection('movies');

    MovieListModel movieListModel = MovieListModel();

    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('movies').get();
    movieList = snapshot.docs;
    movieListModel = await movieListModel.toMovieModel(movieList!);
    return movieListModel;
  }

  @override
  Future<BookingModel> addBooking(BookingEntity entity) async {
    Email send_email;
    CollectionReference bookings =
        FirebaseFirestore.instance.collection('bookings');

    await bookings
        .add({
          'bookingId': entity.bookingId,
          'movieEntity': {
            'movieDescription': entity.movieEntity.movieDescription,
            'movieName': entity.movieEntity.movieName,
            'movieImage': entity.movieEntity.movieImage
          },
          'numberofTickets': entity.numberofTickets,
          'selectedClass': entity.selectedClass,
          'selectedShowTime': entity.selectedShowTime,
          'theaterEntity': {
            'theaterName': entity.theaterEntity.theaterName,
            'theaterLocationLink': entity.theaterEntity.theaterLocationLink,
          }
        })
        .then((value) async => {await sendMail(value)})
        .catchError((error) => print("Failed to add booking: $error"));

    return BookingEntity.fromBookingEntity(entity);
  }

  sendMail(value) async {
    String username = 'agrapgod@gmail.com';
    String password = 'vihanga123';

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'Movie Locator')
      ..recipients.add('vchamindu@gmail.com')
      ..subject = 'Booking Details :: 😀 :: ${DateTime.now()}'
      ..text = 'Your booking reference Id is .\n ${value.id}'
      ..html =
          "<h1>Your booking reference Id is .\n ${value.id}</h1>\n<p>Use above id for any inqiries!</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  @override
  Future<BookingModel> getBookingFromRef(String ref) async {
    final DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('bookings').doc(ref).get();

    final MovieEntity movieEntity = new MovieEntity(
        movieName: snapshot.get('movieEntity')['movieName'],
        movieDescription: snapshot.get('movieEntity')['movieDescription'],
        movieImage: snapshot.get('movieEntity')['movieImage']);
    final String selectedShowTime = snapshot.get('selectedShowTime');
    final int numberofTickets = snapshot.get('numberofTickets');
    final String bookingId = ref;
    final TheaterEntity theaterEntity = new TheaterEntity(
      theaterName: snapshot.get('theaterEntity')['theaterName'],
      theaterLocationLink: snapshot.get('theaterEntity')['theaterLocationLink'],
    );
    final String selectedClass = snapshot.get('selectedClass');

    BookingModel model = new BookingModel(
        movieEntity: movieEntity,
        selectedShowTime: selectedShowTime,
        numberofTickets: numberofTickets,
        theaterEntity: theaterEntity,
        selectedClass: selectedClass,
        bookingId: bookingId);

    return model;
  }

  @override
  Future<BookingModel> updateBooking(BookingEntity entity) async {
    CollectionReference bookings =
        FirebaseFirestore.instance.collection('bookings');

    await bookings.doc(entity.bookingId).update({
      'numberofTickets': entity.numberofTickets,
    }).catchError((error) => print(error));

    return BookingEntity.fromBookingEntity(entity);
  }

  @override
  Future<BookingModel> deleteBooking(BookingEntity entity) async {
    CollectionReference bookings =
        FirebaseFirestore.instance.collection('bookings');

    await bookings
        .doc(entity.bookingId)
        .delete()
        .catchError((error) => print(error));
    ;

    return BookingEntity.fromBookingEntity(entity);
  }

  @override
  Future<TheaterModel> addTheater(TheaterEntity entity) async{

    CollectionReference theaters =
        FirebaseFirestore.instance.collection('bookings');

    await theaters
        .add({
          'availableClasses': {
            entity.availbleClasses
          },
          'showTimeList': {
            entity.showEntityList
          },
          'theaterId': entity.theaterId,
          'theaterImage': entity.theaterImage,
          'theaterLocationLink': entity.theaterLocationLink,
          'theaterName': entity.theaterName,
        })
        .then((value) async => {
              // send_email = Email(
              //   body: 'Booking Reference: '+value.id,
              //   subject: 'subject of email',
              //   recipients: ['vchamindu@gmail.com'],
              //   cc: [],
              //   bcc: [],
              //   attachmentPaths: [],
              //   isHTML: false,
              // ),
              // await FlutterEmailSender.send(send_email)


            })
        .catchError((error) => print("Failed to add booking: $error"));

    return TheaterEntity.fromMovieEntity(entity);
  }
}
