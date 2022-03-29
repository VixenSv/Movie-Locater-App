import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_locator_app/features/data/models/movie.model.dart';

import '../../data/models/MovieList.model.dart';

class MovieListEntity extends Equatable {
  final List<MovieModel> movieList;

  MovieListEntity({required this.movieList}) : super();

  static Future<MovieListEntity> toMovieListEntity(
      MovieListModel movieListModel) async {
    return await MovieListEntity(movieList: movieListModel.movieList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [movieList];
}
