import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bloc.dart';
import 'package:movie_locator_app/features/presentation/pages/Home.page.dart';
import 'package:movie_locator_app/features/presentation/pages/UpdatemovieDetails.page.dart';
import 'package:movie_locator_app/features/presentation/pages/singleMovie.page.dart';
import 'package:movie_locator_app/features/presentation/widgets/redButton.widget.dart';

class AdminMovieCardWidget extends StatelessWidget {
  final onPressed;
  MovieEntity movieEntity;

  AdminMovieCardWidget({Key? key, this.onPressed, required this.movieEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MaterialButton(
    //   onPressed:
    //   child:
    // );

    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        // child: MaterialButton(
        //   color: Color(0xff000000),
        //   onPressed: this.onPressed,
        //   shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.all(Radius.circular(20))),
        //   child:
        // ),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Text(this.movieEntity.movieName,
                              style: TextStyle(
                                  color: Color(0xffB92121),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            RedButtonWidget(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage(
                                            AdminUpdateMoviePage(
                                                movieEntity: this.movieEntity),
                                            'Update Movie')),
                                  );
                                },
                                label: 'Update'),
                            SizedBox(
                              width: 10,
                            ),
                            RedButtonWidget(
                                onPressed: () {
                                  context.read<MovielocatorblocBloc>().add(DeleteMovieEvent(ref: this.movieEntity.movieId));
                                },
                                label: 'Delete')
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
