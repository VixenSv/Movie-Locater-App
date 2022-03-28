import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'movie.model.dart';

class MovieListModel extends Equatable {
  final movieList;

  MovieListModel({this.movieList}) : super();

  Future<MovieListModel> toMovieModel(List<DocumentSnapshot> list) async {
    List<MovieModel> movieList = new List.empty();

    for (var i in list) {
      MovieModel movieModel = new MovieModel(
          movieId: i.data['movieId'],
          movieName: i.data['movieName'],
          movieDescription: i.data['movieDescription'],
          theaterIdList: i.data['theaterIdList'],
          movieImage: i.data['movieImage']);
      movieList.add(movieModel);
    }

    return MovieListModel(movieList: movieList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
