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

    String movieName = '';
    String movieImage = '';
    String movieDescription = '';
    String movieID = '';
    List<TheaterModel> theaterList2 = [];

    MovieModel mm = new MovieModel(
        movieName: movieName,
        movieId: movieID,
        movieDescription: movieDescription,
        theaterList: theaterList2,
        movieImage: movieImage);

    for (DocumentSnapshot i in list) {
      // theaterList.clear();
      movieName = i.get('movieName');
      movieImage = i.get('movieImage');
      movieDescription = i.get('movieDescription');
      movieID = i.id;
      theaterList2 = await getTheaterModel(i);
      mm = new MovieModel(
        movieId: movieID,
          movieName: movieName,
          movieDescription: movieDescription,
          theaterList: theaterList2,
          movieImage: movieImage);
      movieList.add(mm);
    }
    return MovieListModel(movieList: movieList);
  }

  Future<List<TheaterModel>> getTheaterModel(DocumentSnapshot ds) async {
    List<TheaterModel> theaterList = new List.empty(growable: true);

  try{
    String theaterId = '';
    String theaterName = '';
    String theaterImage = '';
    List<dynamic> availbleClasses = [];
    String theaterLocationLink = '';
    List<dynamic> showEntityList = [];

    TheaterModel tm = new TheaterModel(
        theaterId: theaterId,
        theaterName: theaterName,
        theaterImage: theaterImage,
        availbleClasses: availbleClasses,
        theaterLocationLink: theaterLocationLink,
        showEntityList: showEntityList);
    List<dynamic> listRef = await ds.get('theaterList');
    for (var j in listRef) {
      final doc = FirebaseFirestore.instance.doc('theaters/' + j.id);
      await doc.get().then((value) async => {
        theaterId = value.id,
        theaterName = value.get('theaterName'),
        theaterImage = value.get('theaterImage'),
        availbleClasses = value.get('availbleClasses'),
        theaterLocationLink = value.get('theaterLocationLink'),
        showEntityList = value.get('showTimeList'),
        tm = new TheaterModel(
            theaterId: theaterId,
            theaterName: theaterName,
            theaterImage: theaterImage,
            availbleClasses: availbleClasses,
            theaterLocationLink: theaterLocationLink,
            showEntityList: showEntityList),
      });
      theaterList.add(tm);
    }
  } catch(e){

  }

    return theaterList;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [movieList];
}
