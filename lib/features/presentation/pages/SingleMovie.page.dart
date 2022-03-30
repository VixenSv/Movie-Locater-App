import 'package:flutter/material.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
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
  final List<String> showTimeList = [
    '10 - 20',
    '30 - 40',
    '50 - 60',
  ];
  _SingleMoviePageState({required this.movieEntity});

  @override
  Widget build(BuildContext context) {
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
                          borderRadius: BorderRadius.all(Radius.circular(20))),
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
                          borderRadius: BorderRadius.all(Radius.circular(20))),
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
                  Column(
                    children: this
                        .movieEntity
                        .theaterList
                        .map((e) => TheaterDetailCardWidget(
                              showTimeList: showTimeList,
                              movieEntity: this.movieEntity,
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
