import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bloc.dart';


class MovieDetailCardWidget extends StatelessWidget {
  final String movieName;
  final int index;
  final String theaterName;
  final String description;

  MovieDetailCardWidget({
    Key? key,
    required this.movieName,
    required this.theaterName,
    required this.description,
    required this.index,
    required this.movieEntity,
    required this.showTimeList,
  }) : super(key: key);

  final List<dynamic> showTimeList;
  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovielocatorblocBloc, MovielocatorblocState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xff484848),
              borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                          this.movieName,
                          style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Descrioption ' + this.description,
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Show Time : ',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Column(
                              children: this
                              .showTimeList
                              .map((e) => Text(
                                e,
                                style: TextStyle(color: Colors.white),
                              ))
                              .toList(),
                              ),                            
                          ],  
                        ),
                      ],
                    ),
                  )

                  // RedButtonWidget(
                  //   movieEntity: movieEntity,
                  // )
                ],
              )
              )
            ) 
        ),
        );
  }
}

