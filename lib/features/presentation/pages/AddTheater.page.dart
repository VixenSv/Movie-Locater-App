import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/TheaterBloc/bloc/bloc.dart';
import 'package:movie_locator_app/features/presentation/widgets/redButton.widget.dart';

class AddTheaterPage extends StatefulWidget {
  AddTheaterPage({Key? key}) : super(key: key);

  @override
  State<AddTheaterPage> createState() => _AddTheaterPageState();
}

class _AddTheaterPageState extends State<AddTheaterPage> {
  List<String> showTimeList = [];
  List<String> classList = [];
  String startTime = '';
  String endTime = '';
  String classText = '';
  String theaterName = '';
  String theaterLocation = '';
  String theaterImage = '';
  var imageFile;

  @override
  Widget build(BuildContext context) {
    return BlocListener<TheaterBloc, TheaterState>(
      listener: (context, state) {
        if (state is TheaterImageSelected) {
          if (state.imageFile != null) {
          } else {
            const snackBar = SnackBar(
              content: Text('Image Selection Failed! Please Try again'),
            );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        } else if (state is TheaterImageSaved) {
          setState(() {
            theaterImage = state.url;
          });
        }
      },
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
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
                        child: MaterialButton(
                          onPressed: () {
                            context
                                .read<TheaterBloc>()
                                .add(SelectTheaterImageEvent());
                          },
                          child: Column(
                            children: <Widget>[
                              this.theaterImage != ''
                                  ? Center(
                                      child: Image.network(this.theaterImage))
                                  : Lottie.asset('assets/uploadlottie.json'),
                              Text(
                                'Click here to upload image!',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text('Theater Name',
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
                                          TextStyle(color: Colors.white38),
                                      hintText: "Enter your theater name"),
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.white),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      theaterName = newValue!;
                                    });
                                  },
                                )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text('Available  Show Times',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xffB92121),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          TimePickerSpinner(
                            is24HourMode: false,
                            normalTextStyle: TextStyle(
                                fontSize: 15, color: Colors.deepOrange),
                            highlightedTextStyle:
                                TextStyle(fontSize: 15, color: Colors.white),
                            spacing: 1,
                            itemHeight: 15,
                            isForce2Digits: true,
                            onTimeChange: (time) {
                              setState(() {
                                startTime = "${DateFormat.jm().format(time)}";
                              });
                            },
                          ),
                          TimePickerSpinner(
                            is24HourMode: false,
                            normalTextStyle: TextStyle(
                                fontSize: 15, color: Colors.deepOrange),
                            highlightedTextStyle:
                                TextStyle(fontSize: 15, color: Colors.white),
                            spacing: 1,
                            itemHeight: 15,
                            isForce2Digits: true,
                            onTimeChange: (time) {
                              setState(() {
                                endTime = "${DateFormat.jm().format(time)}";
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
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
                            child: MaterialButton(
                              onPressed: () {
                                print(this.showTimeList);
                                setState(() {
                                  showTimeList
                                      .add("From : $startTime  to : $endTime");
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_downward,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  MLAText(
                                    text: 'Add to below list!',
                                    size: 20,
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 4,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff484848),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: ListView.builder(
                                itemCount: this.showTimeList.length,
                                itemBuilder: (context, index) => ListCard(
                                      showTimeList: showTimeList,
                                      index: index,
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
                      child: Text('Theater Location',
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
                                          TextStyle(color: Colors.white38),
                                      hintText: "Google map url"),
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.white),
                                  onChanged: (String? newValue) {
                                    theaterLocation = newValue!;
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
                      child: Text('Available Class',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xffB92121),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.8,
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
                                              TextStyle(color: Colors.white38),
                                          hintText: "Class name"),
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(color: Colors.white),
                                      onChanged: (String? newValue) {
                                        classText = newValue!;
                                      },
                                    )),
                              ),
                            ),
                          ),
                        ),
                        RedButtonWidget(
                            onPressed: () {
                              setState(() {
                                classList.add(classText);
                              });
                            },
                            label: 'Add')
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 4,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff484848),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: ListView.builder(
                                itemCount: this.classList.length,
                                itemBuilder: (context, index) => ListCard(
                                      showTimeList: classList,
                                      index: index,
                                    )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RedButtonWidget(
                        onPressed: () {
                          context.read<TheaterBloc>().add(SaveTheaterDataEvent(
                              theaterEntity: TheaterEntity(
                                theaterName: this.theaterName,
                                theaterLocationLink: this.theaterLocation,
                                availbleClasses: this.classList,
                                showEntityList: this.showTimeList,
                                theaterImage: this.theaterImage
                              )));
                        },
                        label: 'Save',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  final int index;
  const ListCard({Key? key, required this.showTimeList, required this.index})
      : super(key: key);

  final List<String> showTimeList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              this.showTimeList[index],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}

class MLAText extends StatelessWidget {
  final String text;
  final double? size;
  const MLAText({Key? key, required this.text, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: size != null ? size : 15),
    );
  }
}
