import 'package:flutter/cupertino.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';

class MovieDetailsCard extends StatelessWidget {
  final onPressed;
  MovieEntity movieEntity;

  MovieDetailsCard({Key? key, this.onPressed, required this.movieEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
