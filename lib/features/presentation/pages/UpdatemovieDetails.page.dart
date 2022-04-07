import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_locator_app/features/data/models/theater.model.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bloc.dart';
import 'package:movie_locator_app/features/presentation/pages/AddTheater.page.dart';

import '../widgets/redButton.widget.dart';
import 'AdminaddMovie.page.dart';

class AdminUpdateMoviePage extends StatefulWidget {
  final MovieEntity movieEntity;
  const AdminUpdateMoviePage({
    Key? key,
    required this.movieEntity,
  }) : super(key: key);

  @override
  State<AdminUpdateMoviePage> createState() =>
      _AdminUpdateMoviePageState(movieEntity: this.movieEntity);
//movieName : this.movieName, movieDes: this.movieDes, movieImage: this.movieImage);
}

class _AdminUpdateMoviePageState extends State<AdminUpdateMoviePage> {
  final MovieEntity movieEntity;
  List<String> theaterList = [
    'oiechwoihc',
    'loechwoce',
  ];
  String selectedTheater = 'oiechwoihc';
  List<TheaterModel> addedList = [];
  String movieNameText = '';
  String movieDescriptionText = '';
  String movieImageText = '';

  _AdminUpdateMoviePageState({required this.movieEntity});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovielocatorblocBloc, MovielocatorblocState>(
      listener: (context, state) {},
      child: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Color(0xff000000),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text('Movie Name',
                        style: TextStyle(
                            color: Color(0xffB92121),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 17,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff484848),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: TextField(
                                decoration: new InputDecoration(
                                    hintStyle: TextStyle(color: Colors.white38),
                                    hintText: this.movieEntity.movieName),
                                keyboardType: TextInputType.text,
                                style: TextStyle(color: Colors.white),
                                onChanged: (String? newValue) {
                                  movieNameText = newValue!;
                                },
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text('Movie Description',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffB92121),
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 17,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff484848),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: TextField(
                                decoration: new InputDecoration(
                                    hintStyle: TextStyle(color: Colors.white38),
                                    hintText:
                                        this.movieEntity.movieDescription),
                                keyboardType: TextInputType.text,
                                style: TextStyle(color: Colors.white),
                                onChanged: (String? newValue) {
                                  movieDescriptionText = newValue!;
                                },
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text('Movie Image',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffB92121),
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 17,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff484848),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: TextField(
                                decoration: new InputDecoration(
                                    hintStyle: TextStyle(color: Colors.white38),
                                    hintText: this.movieEntity.movieImage),
                                keyboardType: TextInputType.text,
                                style: TextStyle(color: Colors.white),
                                onChanged: (String? newValue) {
                                  movieImageText = newValue!;
                                },
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Image.network(this.movieImageText.length > 0
                          ? this.movieImageText
                          : this.movieEntity.movieImage),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RedButtonWidget(
                            onPressed: () => {
                                  context
                                      .read<MovielocatorblocBloc>()
                                      .add(UpdateMovieEvent(
                                        context: context,
                                        movieEntity: MovieEntity(
                                          movieId: this.movieEntity.movieId,
                                          movieImage: this.movieImageText.length > 0 ? this.movieImageText : this.movieEntity.movieImage,
                                          movieDescription:this.movieDescriptionText.length > 0 ? this.movieDescriptionText : this.movieEntity.movieDescription,
                                          movieName: this.movieNameText.length > 0 ? this.movieNameText : this.movieEntity.movieName,
                                          theaterList: this.movieEntity.theaterList,
                                        ),
                                      ))
                                },
                            label: 'Update Movie'),
                        RedButtonWidget(
                            onPressed: () => {

                                },
                            label: 'Go Back')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
