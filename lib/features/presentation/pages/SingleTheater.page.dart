import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/TheaterBloc/bloc/bloc.dart';
import 'package:movie_locator_app/features/presentation/widgets/redButton.widget.dart';

import 'Home.page.dart';
import 'MovieList.page.dart';
import 'ViewTheaters.page.dart';

class SingleTheaterPage extends StatefulWidget {
  final TheaterEntity theaterEntity;
  SingleTheaterPage({Key? key, required this.theaterEntity}) : super(key: key);

  @override
  State<SingleTheaterPage> createState() =>
      _SingleTheaterPageState(theaterEntity: theaterEntity);
}

class _SingleTheaterPageState extends State<SingleTheaterPage> {
  final TheaterEntity theaterEntity;
  String theaterName = '';
  String theaterLocation = '';
  String theaterImage = '';
  var imageFile;

  _SingleTheaterPageState({required this.theaterEntity});

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
                              Center(
                                  child: Image.network(
                                      this.theaterEntity.theaterImage!)),
                              Text(
                                'Click here change image!',
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
                                      hintText: this.theaterEntity.theaterName),
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
                                itemCount:
                                    this.theaterEntity.showEntityList!.length,
                                itemBuilder: (context, index) => ListCard(
                                      showTimeList: (this
                                              .theaterEntity
                                              .showEntityList as List)
                                          .map((item) => item as String)
                                          .toList(),
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
                                      hintText: this
                                          .theaterEntity
                                          .theaterLocationLink),
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
                                itemCount:
                                    this.theaterEntity.availbleClasses!.length,
                                itemBuilder: (context, index) => ListCard(
                                      showTimeList: (this
                                              .theaterEntity
                                              .availbleClasses as List)
                                          .map((item) => item as String)
                                          .toList(),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RedButtonWidget(
                                      onPressed: () => {
                                            context.read<TheaterBloc>().add(
                                                UpdateTheaterEvent(
                                                    theaterEntity:
                                                        new TheaterEntity(
                                                            theaterId:
                                                                this.theaterEntity.theaterId,
                                                            theaterName:
                                                                this.theaterName.length > 0? this.theaterName : this.theaterEntity.theaterName,
                                                            theaterLocationLink:
                                                            this.theaterLocation.length > 0? this.theaterLocation : this.theaterEntity.theaterLocationLink,
                                                            availbleClasses: this.theaterEntity.availbleClasses,
                                                          showEntityList: this.theaterEntity.showEntityList,
                                                          theaterImage: this.theaterImage.length > 0? this.theaterImage : this.theaterEntity.theaterImage,
                                                        ))),
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage(TheaterListPage(), 'Theaters')),
                                        )
                                          },
                                      label: 'Update Theater'),
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
                                      context.read<TheaterBloc>().add(DeleteTheaterEvent(ref: this.theaterEntity.theaterId)),
                                      Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                      builder: (context) => HomePage(TheaterListPage(), 'Theaters')),
                                      )
                                      },
                                      label: 'Delete Theater'),
                                ],
                              ),
                            )
                          ],
                        ))
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
