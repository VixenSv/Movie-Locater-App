import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_locator_app/features/presentation/bloc/bloc/movielocatorbloc_bloc.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/movielocatorbloc_event.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/movielocatorbloc_state.dart';
import '../../domain/entities/movieList.enitity.dart';

import '../../../../injectionContainer.dart';

class MovieListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                  context.read<MovielocatorblocBloc>().add(GetMovieListEvent());
                } else if (state is MovieListLoaded) {
                  final imageList = state.listEntity;
                  return SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: state.listEntity.movieList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ImageList(
                              index: index,
                              imageListEntity: imageList,
                            );
                          }));
                }
                throw NullThrownError();
              }),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageList extends StatelessWidget {
  const ImageList({
    Key? key,
    required MovieListEntity imageListEntity,
    required int index,
  })  : _imageList = imageListEntity,
        _index = index,
        super(key: key);

  final MovieListEntity _imageList;
  final int _index;

  printlog() {
    print('index is ' + _index.toString());
  }

  @override
  Widget build(BuildContext context) {
    String imagePath = _imageList.movieList[_index];
    return ListTile(
      onTap: printlog,
      title: Container(child: Image.network(imagePath)),
    );
  }
}
