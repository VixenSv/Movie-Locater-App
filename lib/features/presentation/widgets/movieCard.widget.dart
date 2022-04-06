import 'package:flutter/material.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/presentation/pages/Home.page.dart';
import 'package:movie_locator_app/features/presentation/pages/singleMovie.page.dart';

class MovieCardWidget extends StatelessWidget {
  final onPressed;
  MovieEntity movieEntity;

  MovieCardWidget({Key? key, this.onPressed, required this.movieEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                SingleMoviePage(movieEntity: this.movieEntity), 'Movie')),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          height: MediaQuery.of(context).size.height / 5,
          child: MaterialButton(
            color: Color(0xff000000),
            onPressed: this.onPressed,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff000000),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          )),
                      child: Image.network(this.movieEntity.movieImage),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff000000),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Text(this.movieEntity.movieName,
                                      style: TextStyle(
                                          color: Color(0xffB92121),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Expanded(
                                child: Text(
                                    this.movieEntity.movieDescription.substring(
                                          0,
                                          this
                                                      .movieEntity
                                                      .movieDescription
                                                      .length >
                                                  100
                                              ? this
                                                          .movieEntity
                                                          .movieDescription
                                                          .length ~/
                                                      3
                                              : this
                                                  .movieEntity
                                                  .movieDescription
                                                  .length,
                                        ),
                                    style: TextStyle(
                                      color: Colors.white,
                                    )))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
