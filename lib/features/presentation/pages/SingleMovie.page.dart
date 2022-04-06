import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bloc.dart';
import 'package:movie_locator_app/features/presentation/widgets/theaterDetailCard.widget.dart';

class SingleMoviePage extends StatefulWidget {
  final MovieEntity movieEntity;
  const SingleMoviePage({Key? key, required this.movieEntity})
      : super(key: key);

  @override
  State<SingleMoviePage> createState() =>
      _SingleMoviePageState(movieEntity: this.movieEntity);
}

class _SingleMoviePageState extends State<SingleMoviePage> {
  final MovieEntity movieEntity;

  _SingleMoviePageState({required this.movieEntity});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovielocatorblocBloc, MovielocatorblocState>(
      builder: (context, state) {
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
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Image.network(this.movieEntity.movieImage),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        this.movieEntity.movieName,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Color(0xff484848),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              this.movieEntity.movieDescription,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      this.movieEntity.theaterList!.length > 0
                          ? Column(
                              children: this
                                  .movieEntity
                                  .theaterList!
                                  .map((e) => TheaterDetailCardWidget(
                                        index: this
                                            .movieEntity
                                            .theaterList!
                                            .indexOf(e),
                                        showTimeList: e.showEntityList!,
                                        movieEntity: this.movieEntity,
                                        theaterName: e.theaterName,
                                      ))
                                  .toList(),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Expanded(
                                child: Text(
                                  "Movie's currently not screening",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        (MediaQuery.of(context).size.width /
                                            15),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
