import 'package:flutter/material.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';
import 'package:movie_locator_app/features/presentation/widgets/theaterDetailCard.widget.dart';

class BookingPage extends StatefulWidget {
  final MovieEntity movieEntity;
  const BookingPage({Key? key, required this.movieEntity}) : super(key: key);

  @override
  State<BookingPage> createState() =>
      _BookingPageState(movieEntity: this.movieEntity);
}

class _BookingPageState extends State<BookingPage> {
  final MovieEntity movieEntity;

  String dropdownValue = 'One';

  _BookingPageState({required this.movieEntity});

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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                              child: Text(this.movieEntity.movieName,
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
                    child: Text('Select Show Time',
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
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff484848),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: DropdownButton<String>(
                            alignment: Alignment.centerLeft,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            dropdownColor: Color(0xff484848),
                            value: this.dropdownValue,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            style: const TextStyle(color: Colors.white),
                            underline: Container(
                              height: 0,
                            ),
                            items: <String>['One', 'Two', 'Free', 'Four']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              print(newValue);
                              setState(() {
                                dropdownValue:
                                newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
