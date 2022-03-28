import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'movie.model.dart';

class MovieListModel extends Equatable {
  final movieList;

  MovieListModel({this.movieList}) : super();

  Future<MovieListModel> toMovieModel(List<DocumentSnapshot> list) async {
    List<MovieModel> movieList = new List.empty(growable: true);

    for (var i in list) {
      print('+++++++++++++++++++++++++++++++');
      print(i.get('theaterIdList'));
      MovieModel movieModel = new MovieModel(
          movieId: i.get('movieId'),
          movieName: i.get('movieName'),
          movieDescription: i.get('movieDescription'),
          theaterIdList: i.get('theaterIdList'),
          movieImage: i.get('movieImage'));

      print(
          '-------------------------- movieModel -----------------------------');
      print(movieModel);
      movieList.add(movieModel);
    }

    return MovieListModel(movieList: movieList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
