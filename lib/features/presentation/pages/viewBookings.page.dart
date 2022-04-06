import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_locator_app/features/domain/entities/booking.entity.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bookingBloc/bloc/bloc.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bookingBloc/bloc/booking_bloc.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/movielocatorbloc_state.dart';
import 'package:movie_locator_app/features/presentation/widgets/blueButton.widget.dart';
import 'package:movie_locator_app/features/presentation/widgets/redButton.widget.dart';

import '../bloc/bloc/movielocatorbloc_bloc.dart';
import '../bloc/bloc/movielocatorbloc_event.dart';
import 'Home.page.dart';
import 'MovieList.page.dart';

class ViewBookingPage extends StatefulWidget {
  const ViewBookingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewBookingPage> createState() => _ViewBookingPageState();
}

class _ViewBookingPageState extends State<ViewBookingPage> {
  String refId = '';
  int numberOfTickets = 0;
  bool isChanged = false;
  _ViewBookingPageState();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingBlocState>(
      builder: (context, state) {
        print(state);
        if (state is BookingDataLoaded) {
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Image.network(
                                state.bookingEntity.movieEntity.movieImage),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Text('Movie Name',
                              style: TextStyle(
                                  color: Color(0xffB92121),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 17,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff484848),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                        state.bookingEntity.movieEntity
                                            .movieName,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Text('Selected Show Time',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xffB92121),
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 17,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff484848),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: TextField(
                                      enabled: false,
                                      decoration: new InputDecoration(
                                          hintStyle:
                                              TextStyle(color: Colors.white70),
                                          hintText: "0"),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      style: TextStyle(color: Colors.white),
                                      controller: new TextEditingController(
                                          text: state
                                              .bookingEntity.selectedShowTime
                                              .toString()),
                                      onChanged: (String? newValue) {
                                        setState(() {});
                                      },
                                    )),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Text('Number of Tickets',
                              style: TextStyle(
                                  color: Color(0xffB92121),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 17,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff484848),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: TextField(
                                      decoration: new InputDecoration(
                                          hintStyle:
                                              TextStyle(color: Colors.white70),
                                          hintText: state
                                              .bookingEntity.numberofTickets
                                              .toString()),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      style: TextStyle(color: Colors.white),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          numberOfTickets =
                                              int.parse(newValue!);
                                          isChanged = true;
                                        });
                                      },
                                    )),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Text('Selected Class',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xffB92121),
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 17,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff484848),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: TextField(
                                      enabled: false,
                                      decoration: new InputDecoration(
                                          hintStyle:
                                              TextStyle(color: Colors.white70),
                                          hintText: "0"),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      style: TextStyle(color: Colors.white),
                                      controller: new TextEditingController(
                                          text: state
                                              .bookingEntity.selectedClass
                                              .toString()),
                                      onChanged: (String? newValue) {},
                                    )),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Center(
                          child: TextButton(
                              onPressed: () => {
                                    context.read<BookingBloc>().add(
                                        ShowTheaterLocationEvent(
                                            link: state
                                                .bookingEntity
                                                .theaterEntity
                                                .theaterLocationLink))
                                  },
                              child: Text(
                                'Click here to view Theater on map',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RedButtonWidget(
                                      onPressed: () => {
                                            context.read<BookingBloc>().add(UpdateBookingEvent(
                                                bookingEntity: new BookingEntity(
                                                    bookingId: state
                                                        .bookingEntity
                                                        .bookingId,
                                                    movieEntity: state
                                                        .bookingEntity
                                                        .movieEntity,
                                                    selectedShowTime: state
                                                        .bookingEntity
                                                        .selectedShowTime,
                                                    numberofTickets: isChanged
                                                        ? this.numberOfTickets
                                                        : state.bookingEntity
                                                            .numberofTickets,
                                                    theaterEntity: state
                                                        .bookingEntity
                                                        .theaterEntity,
                                                    selectedClass: state
                                                        .bookingEntity
                                                        .selectedClass),
                                                context: context))
                                          },
                                      label: 'Update Booking'),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RedButtonWidget(
                                      onPressed: () => {
                                            context.read<BookingBloc>().add(
                                                DeleteBookingEvent(
                                                    bookingEntity:
                                                        state.bookingEntity,
                                                    context: context))
                                          },
                                      label: 'Delete Booking'),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (state is BookingDataLoding) {
          return Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 10),
                child: Text('Booking Search',
                    style: TextStyle(
                        color: Color(0xffB92121),
                        fontSize: 35,
                        fontWeight: FontWeight.bold)),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextField(
                              decoration: new InputDecoration(
                                hintStyle: TextStyle(color: Colors.white70),
                                hintText: "Booking Reference Id",
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.text,
                              style: TextStyle(color: Colors.white),
                              onChanged: (String? newValue) {
                                setState(() {
                                  refId = newValue!;
                                });
                              },
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: RedButtonWidget(
                            onPressed: () => {
                                  context.read<BookingBloc>().add(
                                      GetBookingDataEvent(refId: this.refId))
                                },
                            label: 'Search')),
                  )
                ],
              ),
            ],
          ));
        } else if (state is BookingUpdating) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BookingUpdated) {
          return Center(
            child: AlertDialog(
              title: Text('Booking Update'),
              content: Text('Updated Successfully! navigating back to home page.'),
              actions: [
                TextButton(
                  onPressed: () {
                    context.read<MovielocatorblocBloc>().add(
                        GoHomeEvent());

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(MovieListPage(), 'Movie List')),
                    );
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }else if(state is BookingDeleting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else if(state is BookingDeleted){
          return Center(
            child: AlertDialog(
              title: Text('Delete'),
              content: Text('Deleted Successfully! navigating back to home page.'),
              actions: [
                TextButton(
                  onPressed: () {
                    context.read<MovielocatorblocBloc>().add(
                        GoHomeEvent());

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(MovieListPage(), 'Movie List')),
                    );
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
        return Container(
          child: Text('No data'),
        );
      },
    );
  }
}
