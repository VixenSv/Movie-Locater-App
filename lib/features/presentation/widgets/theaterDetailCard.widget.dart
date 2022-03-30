import 'package:flutter/material.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/presentation/pages/Booking.page.dart';
import 'package:movie_locator_app/features/presentation/pages/Home.page.dart';
import 'package:movie_locator_app/features/presentation/widgets/redButton.widget.dart';

class TheaterDetailCardWidget extends StatelessWidget {
  const TheaterDetailCardWidget(
      {Key? key, required this.showTimeList, required this.movieEntity})
      : super(key: key);

  final List<String> showTimeList;
  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  Text('Theater: Liberty'),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Show Times:'),
                      SizedBox(
                        width: 5.0,
                      ),
                      Column(
                        children:
                            this.showTimeList.map((e) => Text(e)).toList(),
                      )
                    ],
                  )
                ],
              )),
              RedButtonWidget(
                movieEntity: movieEntity,
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(
                          BookingPage(movieEntity: this.movieEntity),
                          'Book Now')),
                ),
                label: 'Book Now',
              )
            ],
          ),
        ),
      ),
    );
  }
}
