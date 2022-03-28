import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/models/MovieList.model.dart';

class MovieListEntity extends Equatable {
  final List<String> imageList;

  MovieListEntity({required this.imageList}) : super();

  static Future<MovieListEntity> toMovieListEntity(
      MovieListModel movieListModel) async {
    return await MovieListEntity(imageList: movieListModel.movieList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
