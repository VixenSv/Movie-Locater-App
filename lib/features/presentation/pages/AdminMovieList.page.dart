import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/domain/entities/movieList.enitity.dart';
import 'package:movie_locator_app/features/domain/usecases/getMovieList.usecase.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bloc.dart';
import 'package:movie_locator_app/features/presentation/pages/MovieList.page.dart';
import 'package:movie_locator_app/features/presentation/widgets/movieCard.widget.dart';

import '../../data/models/theater.model.dart';
import '../widgets/adminMovieCard.widget.dart';

class AdminMovieListPage extends StatelessWidget {
  // const AdminMovieListPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return SingleChildScrollView(
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                BlocBuilder<MovielocatorblocBloc, MovielocatorblocState>(
                    builder: (context, state) {
                  if (state is Empty) {
                    return Text('Empty!');
                  } else if (state is MovieListLoading) {
                    context
                        .read<MovielocatorblocBloc>()
                        .add(GetMovieListEvent(isAdmin: true));
                  } else if (state is MovieListLoaded) {
                    final movieList = state.listEntity;
                    return SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: ListView.builder(
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: state.listEntity.movieList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return AdminMovieList(
                                index: index,
                                movieListEntity: movieList,
                              );
                            }));
                  } else if (state is Error) {
                    return Container(
                      child: Text('Error'),
                    );
                  }
                  return Container(
                    child: Text('No data in Admin Movie List'),
                  );
                }),
                SizedBox(
                  height: 10.0,
                ),

                
              ],
            )),
      ),
    );
  }
}

class AdminMovieList extends StatelessWidget {
  const AdminMovieList({
    Key? key,
    required MovieListEntity movieListEntity,
    required int index,
  })  : _movieList = movieListEntity,
        _index = index,
        super(key: key);

  final MovieListEntity _movieList;
  final int _index;

  @override
  Widget build(BuildContext context) {
    String movieId = _movieList.movieList[_index].movieId;
    String movieName = _movieList.movieList[_index].movieName;
    String movieDescription = _movieList.movieList[_index].movieDescription;
    String movieImage = _movieList.movieList[_index].movieImage;
    List<TheaterModel> theatherIdList = _movieList.movieList[_index].theaterList!;

    return Expanded(
        child: AdminMovieCardWidget(
            movieEntity: new MovieEntity(
              movieId: movieId,
                movieName: movieName,
                movieDescription: movieDescription,
                movieImage: movieImage,
                theaterList: theatherIdList)));
  }
}
