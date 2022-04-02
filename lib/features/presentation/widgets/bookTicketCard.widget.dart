import 'dart:ffi';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_locator_app/core/error/faliure.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bloc.dart';

// class BookTicketCardWidget extends StatelessWidget {
//   const BookTicketCardWidget({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }

class BookTicketCardWidget extends StatelessWidget {
  final onPressed;
  MovieEntity movieEntity;
  //final class = ['class A', 'class B', 'class C'];

  BookTicketCard({Key? key, this.onPressed, required this.movieEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BookTicketCard(
      child: Padding(
      padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/film.jpg'),
            radius: 40.0,
          ),
        ),
        Divider(
          height: 60.0,
          color: Colors.grey[800],
        ),
        Text('Movie',
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            )),
        SizedBox(
          height: 10.0,
        ),
        Text('Cchun-Li',
            style: TextStyle(
              color: Colors.amberAccent[200],
              letterSpacing: 2.0,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(
          height: 30.0,
        ),
        Text('Show time',
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            )),
        SizedBox(
          height: 10.0,
        ),
        //drop down for show time
        SizedBox(
          height: 10.0,
        ),
        Text('Number of Seats',
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            )),
        SizedBox(
          height: 10.0,
        ),
      //implemt the input feild of number of seats
        child: DropdownButton<String>(items: items.map(BuildMenuItem).toList(),
        ),
        Text('Class',
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            )),
        SizedBox(
          height: 10.0,
        ),

        //implement the Drop down to select the class of the Ticket
        child: DropdownButton<String>(items: items.map(BuildMenuItem).toList(),
        ),
        Divider(
          height: 60.0,
          color: Colors.grey[800],
        ),
        Row(
          children: [
          Text('Movie',
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            )),
        SizedBox(
          height: 10.0,
        ),

          Text('Movie',
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            )),
        SizedBox(
          height: 10.0,
        ),

              ],
            )      
      ]),
    ));
  }
}
