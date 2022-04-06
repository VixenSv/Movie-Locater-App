import 'package:bashbop/controller/edit_controller.dart';
import 'package:bashbop/utils/text_style.dart';
import 'package:bashbop/widgets/drop_down.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentsView extends StatefulWidget {
  const RecentsView({Key? key}) : super(key: key);

  @override
  State<RecentsView> createState() => _RecentsViewState();
}

class _RecentsViewState extends State<RecentsView> {
  TextEditingController descrip = TextEditingController();
  FocusNode des_focous = FocusNode();
  EditDiloag(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        descrip.text = obj.set_data['description'];
        slected_feedback = obj.set_data['topic'];
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            contentPadding: EdgeInsets.all(10),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 15,
                ),
                _buildDropDown(feedback_type, true),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 80,
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    controller: descrip,
                    focusNode: des_focous,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      labelText: 'Description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                      ),
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Write Your Feedback',
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Edit button
                    InkWell(
                      onTap: () async {
                        print("hello ${descrip.text}");
                        print("hello ${slected_feedback}");
                        await FirebaseFirestore.instance
                            .collection('feedback')
                            .doc(obj.feedback_id.value)
                            .update({
                          'userid': "",
                          'topic': "$slected_feedback",
                          'submission_date': DateTime.now(),
                          'description': descrip.text
                        });
                        Get.back();
                      },
                      child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0XFFC8E5F5)),
                        child: const Center(
                          child: Text(
                            "Save",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    // cancelbutton
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0XFFC8E5F5)),
                        child: const Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        });
      },
    );
  }

  String? slected_feedback;
  List<String> feedback_type = <String>[
    'Something is wrong with this task',
    'Account & security',
    'Other Problem',
    'Other Feedback'
  ];
  var obj = Get.put(EditController());
  @override
  Widget build(BuildContext context) {
    var heightsize = MediaQuery.of(context).size.height;
    var widthsize = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 70, 70, 70),
      appBar: AppBar(
        title: Text(
          "Recent Feedback",
          style: appbar_text,
        ),
        backgroundColor: Color.fromARGB(255, 70, 70, 70),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.white,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: heightsize * 0.01),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('feedback')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.active &&
                        snapshot.hasData &&
                        snapshot.data!.docs.length == 0) {
                      return const Center(
                        child: Text("No Feedback Found"),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.active &&
                        snapshot.hasData &&
                        snapshot.data!.docs.isNotEmpty) {
                      var userdocument = snapshot.data!.docs;
                      return ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, i) {
                            return InkWell(
                              onTap: () {
                                obj.set_single_data(userdocument[i].data());
                                obj.set_id(userdocument[i].id);
                                print("sdasda${userdocument[i].data()}");
                                EditDiloag(context);
                              },
                              child: Material(
                                elevation: 8,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.65,
                                                child: Text(
                                                  "${userdocument[i]['topic']}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              )),
                                          Container(
                                            width: widthsize * 0.65,
                                            child: Text(
                                              '${userdocument[i]['description']}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                      InkWell(
                                          onTap: () {
                                            FirebaseFirestore.instance
                                                .collection('feedback')
                                                .doc(userdocument[i].id)
                                                .delete();
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            size: 30,
                                            color: Color.fromARGB(
                                                255, 187, 32, 29),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, i) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: userdocument.length);
                    }
                    return Center(
                      child: Container(
                        height: 800,
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Center(
                                child: CircularProgressIndicator(
                              color: Colors.blueAccent,
                            ))
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropDown(list, check) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 20),
      child: Material(
          color: Color(0XFFC8E5F5),
          elevation: 5,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color(0XFFC8E5F5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropDownWidget(
              hint: 'Select the Topic',
              onChanged: (_) {
                slected_feedback = _;
              },
              list: list,
              select: slected_feedback,
            ),
          )),
    );
  }
}
