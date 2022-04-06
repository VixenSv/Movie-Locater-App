import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_locator_app/features/data/models/theater.model.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';

import '../../domain/entities/movie.entity.dart';
import 'package:image_picker/image_picker.dart';

class MovieModel extends MovieEntity {
  MovieModel({

    required String movieName,
    required String movieDescription,
    required List<TheaterModel> theaterList,
    required String movieImage,
  }) : super(

            movieName: movieName,
            movieDescription: movieDescription,
            theaterList: theaterList,
            movieImage: movieImage);

  //method to convert picked Image into a image model
  static Future<MovieModel> fromFile(
      PickedFile pickedFile,
      String movieName,
      String movieDescription,
      List<TheaterModel> theaterList,
      String movieImage) async {
    return await MovieModel(
        movieName: movieName,
        movieDescription: movieDescription,
        movieImage: pickedFile.path,
        theaterList: theaterList,);
  }
}
