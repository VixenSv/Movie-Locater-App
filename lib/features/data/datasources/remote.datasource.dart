import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../core/error/exception.dart';
import '../models/MovieList.model.dart';
import '../models/movie.model.dart';

abstract class RemoteDataSource {
  Future<MovieListModel> getImageList();
  Future<MovieModel> saveUrl(MovieModel movieModel);
  Future<MovieModel> uploadImage(MovieModel movieModel);
}

// class RemoteDataSourceImpl implements RemoteDataSource {
//   StreamSubscription<QuerySnapshot>? subscription;
//   List<DocumentSnapshot>? movieList;
//   MovieListModel? movieListModel;

//   @override
//   Future<MovieModel> saveUrl(MovieModel movieModel) {
//     CollectionReference refs = Firestore().collection('images');

//     return refs
//         .add({
//           'url': movieModel.movieImage, // John Doe
//         })
//         .then((value) => movieModel)
//         .catchError((error) => ServerException());
//   }

//   @override
//   Future<MovieModel> uploadImage(MovieModel movieModel) async {
//     final _imageName = movieModel.movieImage;
//     final _storage = FirebaseStorage.instance;
//     var downloadUrl;
//     //Check permission

//     if (movieModel.movieImage != null) {
//       var file = File(movieModel.movieImage!);
//       //Upload to fire base
//       var snapshot = await _storage
//           .ref()
//           .child('movieImages/$_imageName')
//           .putFile(file);

//       downloadUrl = await snapshot.ref.getDownloadURL();

//       return MovieModel(
//         movieImage: downloadUrl,
//         movieDescription: null,
//         movieId: null,
//         movieName: null,
//         theaterIdList: null,
//       );
//     } else {
//       print('No path Received');
//       throw ServerException();
//     }
//   }

//   @override
//   Future<MovieListModel> getImageList() async {
//     CollectionReference collectionReference =
//         await Firestore().collection('movies');
//     MovieListModel movieListModel = MovieListModel();
//     final QuerySnapshot snapshot = await collectionReference.getDocuments();

//     movieList = await snapshot.documents;
//     movieListModel = await movieListModel.toMovieModel(movieList!);
//     return movieListModel;
//   }
// }
