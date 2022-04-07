import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_locator_app/features/data/models/theater.model.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';

import 'package:movie_locator_app/features/presentation/bloc/bloc/movielocatorbloc_bloc.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/movielocatorbloc_event.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/movielocatorbloc_state.dart';
import 'package:movie_locator_app/features/presentation/widgets/movieCard.widget.dart';
import '../../domain/entities/movieList.enitity.dart';

import '../../../../injectionContainer.dart';

class MovieListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return BlocBuilder<MovielocatorblocBloc, MovielocatorblocState>(
        builder: (context, state) {
      if (state is Empty) {
        return Text('Empty!');
      } else if (state is MovieListLoading) {
        //calling the events
        context.read<MovielocatorblocBloc>().add(GetMovieListEvent());
      } else if (state is MovieListLoaded) {
        final movieList = state.listEntity;
        return ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: state.listEntity.movieList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return MovieList(
                index: index,
                movieListEntity: movieList,
              );
            });
      } else if (state is Error) {
        return Container(
          child: Text('Error'),
        );
      }
      return Container(
        child: Text('No data'),
      );
    });
  }
}

class MovieList extends StatelessWidget {
  const MovieList({
    Key? key,
    required MovieListEntity movieListEntity,
    required int index,
  })  : _movieList = movieListEntity,
        _index = index,
        super(key: key);

  final MovieListEntity _movieList;
  final int _index;

  printlog() {
    print('index is ' + _index.toString());
  }

  @override
  Widget build(BuildContext context) {
    String movieImage = _movieList.movieList[_index].movieImage;
    String movieName = _movieList.movieList[_index].movieName;
    String movieDescription = _movieList.movieList[_index].movieDescription;
    List<TheaterModel> theatherList = _movieList.movieList[_index].theaterList!;
    return Expanded(
        child: MovieCardWidget(
      movieEntity: new MovieEntity(
          movieImage: movieImage,
          movieName: movieName,
          movieDescription: movieDescription,
          theaterList: theatherList),
    ));
  }
}
