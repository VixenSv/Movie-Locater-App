import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_locator_app/features/data/models/theater.model.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';

import '../../data/models/movie.model.dart';

class MovieEntity extends Equatable {
  final String movieName;
  final String movieImage;
  final String movieDescription;
  final List<TheaterModel>? theaterList;
  final String movieId;

  MovieEntity(
      {
        required this.movieId,
        required this.movieImage,
      required this.movieName,
      required this.movieDescription,
       this.theaterList})
      : super();

  static Future<MovieEntity> toMovieEntity(MovieModel movieModel) async {
    return await MovieEntity(
        movieId: movieModel.movieId,
        movieDescription: movieModel.movieDescription,
        movieName: movieModel.movieName,
        theaterList: movieModel.theaterList,
        movieImage: movieModel.movieImage);
  }

  static Future<MovieModel> fromMovieEntity(MovieEntity movieEntity) async {
    return await MovieModel(
      movieId: movieEntity.movieId,
        movieName: movieEntity.movieName,
        movieDescription: movieEntity.movieDescription,
        movieImage: movieEntity.movieImage,
        theaterList: movieEntity.theaterList!);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        this.movieName,
        this.movieImage,
        this.movieDescription,
        this.theaterList
      ];
}
