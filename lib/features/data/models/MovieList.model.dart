import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_locator_app/features/data/models/show.model.dart';
import 'package:movie_locator_app/features/data/models/theater.model.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';

import 'movie.model.dart';

class MovieListModel extends Equatable {
  final List<MovieModel>? movieList;

  MovieListModel({this.movieList}) : super();

  Future<MovieListModel> toMovieModel(List<DocumentSnapshot> list) async {
    List<MovieModel> movieList = new List.empty(growable: true);
    List<TheaterModel> theaterList = new List.empty(growable: true);

    String theaterName = '';
    int theaterId = 0;
    String theaterImage = '';
    List<dynamic> availbleClasses = [];
    String theaterLocationLink = '';
    List<dynamic> showEntityList = [];

    TheaterModel tm = new TheaterModel(
        theaterName: theaterName,
        theaterId: theaterId,
        theaterImage: theaterImage,
        availbleClasses: availbleClasses,
        theaterLocationLink: theaterLocationLink,
        showEntityList: showEntityList);

    String movieName = '';
    String movieImage = '';
    String movieDescription = '';
    int movieID = 0;
    List<TheaterModel> theaterList2 = [];

    MovieModel mm = new MovieModel(
        movieId: movieID,
        movieName: movieName,
        movieDescription: movieDescription,
        theaterList: theaterList2,
        movieImage: movieImage);

    for (DocumentSnapshot i in list) {
      theaterList.clear();
      List<dynamic> listRef = await i.get('theaterList');
      Set<TheaterModel> theaterSet;
      for (var j in listRef) {
        final doc = await FirebaseFirestore.instance.doc('theaters/' + j.id);
        await doc.get().then((value) async => {
              theaterName = value.get('theaterName'),
              theaterId = value.get('theaterId'),
              theaterImage = value.get('theaterImage'),
              availbleClasses = value.get('availbleClasses'),
              theaterLocationLink = value.get('theaterLocationLink'),
              showEntityList = value.get('showTimeList'),

              tm = new TheaterModel(
                  theaterName: theaterName,
                  theaterId: theaterId,
                  theaterImage: theaterImage,
                  availbleClasses: availbleClasses,
                  theaterLocationLink: theaterLocationLink,
                  showEntityList: showEntityList),
            });
        theaterList.add(tm);
      }
      movieName = i.get('movieName');
      movieImage = i.get('movieImage');
      movieDescription = i.get('movieDescription');
      movieID = i.get('movieId');
      theaterList2 = theaterList;
      mm = new MovieModel(
          movieId: movieID,
          movieName: movieName,
          movieDescription: movieImage,
          theaterList: theaterList2,
          movieImage: movieImage);
      movieList.add(mm);
    }
    return MovieListModel(movieList: movieList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [movieList];
}
