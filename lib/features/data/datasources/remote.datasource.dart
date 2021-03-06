import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../core/error/exception.dart';
import '../models/MovieList.model.dart';
import '../models/movie.model.dart';

abstract class RemoteDataSource {
  Future<MovieListModel> getImageList();
  Future<MovieModel> saveUrl(MovieModel movieModel);
  Future<MovieModel> uploadMovie(MovieModel movieModel);
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
        movieId: 0,
        movieName: '',
        theaterIdList: [],
      );
    } else {
      print('No path Received');
      throw ServerException();
    }
  }

  @override
  Future<MovieListModel> getImageList() async {
    CollectionReference collectionReference =
        await FirebaseFirestore.instance.collection('movies');

    MovieListModel movieListModel = MovieListModel();
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('movies').get();
    //     .then((QuerySnapshot querySnapshot) async {
    //   querySnapshot.docs.forEach((doc) {
    //     print(
    //         " +++++++++++++++++++++++++++++++++++ collection Reference ++++++++++++++++++++++++++++++++++++++");
    //     print(doc['movieName']);
    //     print(doc['movieId']);
    //     print(doc['movieDescription']);
    //     print(doc['movieImage']);
    //   });
    //   return querySnapshot;
    // });

    movieList = await snapshot.docs;
    movieListModel = await movieListModel.toMovieModel(movieList!);
    return movieListModel;
  }
}
