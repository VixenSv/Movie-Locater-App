import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_locator_app/features/data/models/theater.model.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';

import '../../data/models/movie.model.dart';

class MovieEntity extends Equatable {
  final String movieName;
  final String movieImage;
  final String movieDescription;
  final int movieID;
  final List<TheaterModel> theaterList;

  MovieEntity(
      {required this.movieImage,
      required this.movieID,
      required this.movieName,
      required this.movieDescription,
      required this.theaterList})
      : super();

  static Future<MovieEntity> toMovieEntity(MovieModel movieModel) async {
    return await MovieEntity(
        movieDescription: movieModel.movieDescription,
        movieID: movieModel.movieID,
        movieName: movieModel.movieName,
        theaterList: movieModel.theaterList,
        movieImage: movieModel.movieImage);
  }

  static Future<MovieModel> fromMovieEntity(MovieEntity movieEntity) async {
    return await MovieModel(
        movieId: movieEntity.movieID,
        movieName: movieEntity.movieName,
        movieDescription: movieEntity.movieDescription,
        movieImage: movieEntity.movieImage,
        theaterList: movieEntity.theaterList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        this.movieID,
        this.movieName,
        this.movieImage,
        this.movieDescription,
        this.theaterList
      ];
}
