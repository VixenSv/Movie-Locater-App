import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bloc.dart';

class AdminAddMoviePage extends StatefulWidget {
  final String movieId;
  final String movieName;
  final String movieDes;
  final String movieImage;
  //final List<dynamic> showTimeList;

  const AdminAddMoviePage(
      {Key? key,
      //required this.movieId,
      required this.movieName,
      required this.movieDes,
      required this.movieImage, 
      required this.movieId})
      : super(key: key);

  @override
  State<AdminAddMoviePage> createState() => _AdminAddMoviePageState();
  //movieName : this.movieName, movieDes: this.movieDes, movieImage: this.movieImage);
}

class _AdminAddMoviePageState extends State<AdminAddMoviePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovielocatorblocBloc, MovielocatorblocState>(
        builder: (context, state) {
      if (state is AddingMovie) {
        return SingleChildScrollView(
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
                                child: Text(
                                    'AFTER', //Text(state.movieEntity.movieName,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
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
                                child: Text(
                                    'AFTER', //state.movieEntity.movieName,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
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
                                child: Text(
                                    'AFTER', //child: Text(state.movieEntity.movieName,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ),

                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AddMovieButtonWidget(
                            movieEntity: state.movieEntity,
                            onPressed () => {
                              context.read,MovielocatorblocBloc>().add(AddMovieEvent(
                                context: context,
                                addingMovieEntity: new AddMovieEntity(
                                  movieId: 0, movieEntity: state.movieEntity, movieName: state.movieName, movieDescription: state.movieImage 
                                )
                              ))
                            },
                            label: 'Add Movie'
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
        );
      }
      return Container(
        child: Text('No Data'),
      );
    });
  }
}
