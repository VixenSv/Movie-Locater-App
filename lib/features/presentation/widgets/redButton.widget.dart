import 'package:flutter/material.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/presentation/pages/Booking.page.dart';
import 'package:movie_locator_app/features/presentation/pages/Home.page.dart';

class RedButtonWidget extends StatelessWidget {
  const RedButtonWidget(
      {Key? key,
      required this.movieEntity,
      required this.onPressed,
      required this.label})
      : super(key: key);

  final MovieEntity movieEntity;
  final onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: this.onPressed,
        color: Color(0xffB92121),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Text(
          this.label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
