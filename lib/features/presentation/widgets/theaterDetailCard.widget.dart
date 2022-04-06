import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_locator_app/features/data/models/theater.model.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bloc.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/movielocatorbloc_bloc.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/movielocatorbloc_event.dart';
import 'package:movie_locator_app/features/presentation/pages/Booking.page.dart';
import 'package:movie_locator_app/features/presentation/pages/Home.page.dart';
import 'package:movie_locator_app/features/presentation/widgets/redButton.widget.dart';

class TheaterDetailCardWidget extends StatelessWidget {
  final String theaterName;
  final int index;
  TheaterDetailCardWidget(
      {Key? key,
      required this.showTimeList,
      required this.movieEntity,
      required this.index,
      required this.theaterName})
      : super(key: key);

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
                    Text(
                      'Theater: ' + this.theaterName,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Show Times:',
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
                        )
                      ],
                    )
                  ],
                )),
                RedButtonWidget(
                  onPressed: () => context.read<MovielocatorblocBloc>().add(
                      BookingEvent(
                          context: context,
                          movieEntity: this.movieEntity,
                          theaterEntity: this.movieEntity.theaterList![index])),
                  // onPressed: () => Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => HomePage(
                  //           BookingPage(movieEntity: this.movieEntity,theaterEntity: this.movieEntity.theaterList[index],),
                  //           'Book Now')),
                  // ),
                  label: 'Book Now',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
