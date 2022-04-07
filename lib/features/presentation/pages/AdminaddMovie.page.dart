import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_locator_app/features/data/models/theater.model.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bloc.dart';
import 'package:movie_locator_app/features/presentation/pages/AddTheater.page.dart';

import '../widgets/redButton.widget.dart';

class AdminAddMoviePage extends StatefulWidget {
  // final String movieId;
  // final String movieName;
  // final String movieDes;
  // final String movieImage;
  //final List<dynamic> showTimeList;

  const AdminAddMoviePage({
    Key? key,
    //required this.movieId,
    // required this.movieName,
    // required this.movieDes,
    // required this.movieImage,
    // required this.movieId
  }) : super(key: key);

  @override
  State<AdminAddMoviePage> createState() => _AdminAddMoviePageState();
  //movieName : this.movieName, movieDes: this.movieDes, movieImage: this.movieImage);
}

class _AdminAddMoviePageState extends State<AdminAddMoviePage> {
  List<String> theaterList = ['Liberty', 'Savoy', 'Majestic city', 'Ceylon'];
  String selectedTheater = 'Liberty';
  List<TheaterModel> addedList = [];
  String movieNameText = '';
  String movieDescriptionText = '';
  String movieImageText = '';

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
                                    hintText: "Movie name"),
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
                                    hintText: "Movie Description"),
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
                    child: Text('Choose Movie Image',
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
                                    hintText: "Movie Image Url"),
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
                    padding: const EdgeInsets.only(left: 18),
                    child: Text('Select Theaters',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffB92121),
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.8,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff484848),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: DropdownButton<String>(
                                dropdownColor: Color(0xff484848),
                                value: this.selectedTheater,
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 16,
                                style: const TextStyle(color: Colors.white),
                                underline: Container(
                                  height: 0,
                                ),
                                items: this
                                    .theaterList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedTheater = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      RedButtonWidget(
                          onPressed: () {
                            setState(() {
                              addedList.add(new TheaterModel(
                                  theaterId: '',
                                  theaterName: this.selectedTheater,
                                  theaterImage: '',
                                  availbleClasses: [],
                                  theaterLocationLink: '',
                                  showEntityList: []));
                            });
                          },
                          label: 'Add theater')
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: this
                          .addedList
                          .map((e) => MLAText(
                                text: e.theaterName,
                              ))
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RedButtonWidget(
                            onPressed: () => {
                                  context
                                      .read<MovielocatorblocBloc>()
                                      .add(AddMovieEvent(
                                        context: context,
                                        movieEntity: MovieEntity(
                                          movieId: '',
                                          movieImage: this.movieImageText,
                                          movieDescription:
                                              this.movieDescriptionText,
                                          movieName: this.movieNameText,
                                          theaterList: this.addedList,
                                        ),
                                      ))
                                },
                            label: 'Add Movie')
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
