import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/models/MovieList.model.dart';

class MovieListEntity extends Equatable {
  final List<String> movieList;

  MovieListEntity({required this.movieList}) : super();

  static Future<MovieListEntity> toMovieListEntity(
      MovieListModel movieListModel) async {
    return await MovieListEntity(movieList: movieListModel.movieList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
