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
    List<ShowModel> showList = new List.empty(growable: true);
    for (DocumentSnapshot i in list) {
      try {
        List<dynamic> listRef = await i.get('theaterList');
        Set<TheaterModel> theaterSet;
        List<dynamic> showRef = new List.empty(growable: true);
        for (var j in listRef) {
          final doc = await FirebaseFirestore.instance.doc('theaters/' + j.id);
          DocumentReference docShow;
          await doc.get().then((value) async => {
                showRef = value.get('showEntityList'),
                for (var k in showRef)
                  {
                    docShow =
                        await FirebaseFirestore.instance.doc('shows/' + k.id),
                    showList.clear(),
                    await docShow.get().then((valueShow) => {
                          showList.add(new ShowModel(
                              showTime: valueShow.get('showTime'))),
                          theaterList.add(new TheaterModel(
                              theaterName: value.get('theaterName'),
                              theaterId: value.get('theaterId'),
                              theaterImage: value.get('theaterImage'),
                              availbleClasses: value.get('availbleClasses'),
                              theaterLocationLink:
                                  value.get('theaterLocationLink'),
                              showEntityList: showList)),
                          theaterSet = new Set.from(theaterList),
                          movieList.add(new MovieModel(
                              movieId: i.get('movieId'),
                              movieName: i.get('movieName'),
                              movieDescription: i.get('movieDescription'),
                              theaterList: theaterSet.toList(growable: false),
                              movieImage: i.get('movieImage'))),
                        }),
                  },
              });
        }
      } catch (e) {
        print(e);
      }
    }
    return MovieListModel(movieList: movieList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [movieList];
}
