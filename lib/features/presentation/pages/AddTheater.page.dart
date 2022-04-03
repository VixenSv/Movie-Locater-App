import 'package:flutter/material.dart';
 

class AddTheaterPage extends StatefulWidget {
   AddTheaterPage({Key? key}) : super(key: key);
 
   @override
   State<AddTheaterPage> createState() => _AddTheaterPageState();
 }
 
 class _AddTheaterPageState extends State<AddTheaterPage> {
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Image.network(""),
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
                                    child: Text("",
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
                                          hintText: "0"),
                                      keyboardType: TextInputType.number,
                                       
                                      style: TextStyle(color: Colors.white),
                                      onChanged: (String? newValue) {
                                         
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
                          child: Text('Select Class',
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
                               
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                           
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
          
        }
         
}
 