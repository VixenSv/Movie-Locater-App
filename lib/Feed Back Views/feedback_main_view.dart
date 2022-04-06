import 'package:bashbop/Feed%20Back%20Views/recent_feedback_views.dart';
import 'package:bashbop/utils/text_style.dart';
import 'package:bashbop/widgets/buttons.dart';
import 'package:bashbop/widgets/drop_down.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedBackMain extends StatefulWidget {
  const FeedBackMain({Key? key}) : super(key: key);

  @override
  State<FeedBackMain> createState() => _FeedBackMainState();
}

class _FeedBackMainState extends State<FeedBackMain> {
  String? slected_feedback;
  List<String> feedback_type = <String>[
    'Something is wrong with this task',
    'Account & security',
    'Other Problem',
    'Other Feedback'
  ];
  var description_valid = "";
  TextEditingController descrip = TextEditingController();
  FocusNode des_focous = FocusNode();

  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var heightsize = MediaQuery.of(context).size.height;
        var widthsize = MediaQuery.of(context).size.width;
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 70, 70, 70),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.all(10),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 100,
                width: 110,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage("assets/images/feed_back.png")),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                  child: Text(
                "Thank You",
                style: dropdown_heading,
              )),
              const SizedBox(
                height: 10,
              ),
              Container(
                  // height: heightsize*0.05,

                  width: widthsize,
                  child: Text(
                    "Thank You For Sharing your Thoughts.\n We appreciate your Feedback",
                    textAlign: TextAlign.center,
                    style: dropdown_sub_heading,
                  )),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 50, right: 50),
                  height: 50,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blueAccent),
                  child: const Center(
                    child: Text(
                      "Ok",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    des_focous.addListener(() async {
      if (!des_focous.hasFocus) {
        if (descrip.text.trim() == "") {
          description_valid = "Required This Field";
          setState(() {});
          return;
        } else {
          description_valid = "null";
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var heightsize = MediaQuery.of(context).size.height;
    var widthsize = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 70, 70, 70),
      appBar: AppBar(
        title: Text(
          "Feedback Screen",
          style: appbar_text,
        ),
        backgroundColor: Color.fromARGB(255, 70, 70, 70),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(heightsize * 0.03),
                height: heightsize * 0.2,
                width: widthsize,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage("assets/images/feed_back.png")),
                    border: Border.all(
                        color: Color.fromARGB(0, 0, 0, 0), width: 1)),
              ),
              SizedBox(
                height: heightsize * 0.001,
              ),
              Text(
                "Your Feedback is very Important For us",
                style: heading,
              ),
              SizedBox(
                height: heightsize * 0.01,
              ),
              Container(
                  height: heightsize * 0.07,
                  width: widthsize * 0.8,
                  child: Text(
                    "Please Select a below & let us know about your concern",
                    textAlign: TextAlign.center,
                    style: sub_heading,
                  )),
              _buildDropDown(feedback_type, true),
              SizedBox(
                height: heightsize * 0.01,
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      textInputAction: TextInputAction.done,
                      controller: descrip,
                      focusNode: des_focous,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        labelText: 'Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.0),
                        ),
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Write Your Feedback',
                        hintStyle:
                            TextStyle(fontSize: 12, color: Color(0xA3FFFFFF)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    description_valid == "null"
                        ? SizedBox()
                        : Text(
                            description_valid,
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              //Submit Button
              AuthButton(
                buttoncolor:
                    description_valid == "null" && slected_feedback != ""
                        ? Color(0xFFBB201D)
                        : Color.fromARGB(255, 187, 32, 29).withOpacity(0.6),
                onTap: description_valid == "null" && slected_feedback != ""
                    ? () async {
                        await FirebaseFirestore.instance
                            .collection("feedback")
                            .add({
                          'userid': "",
                          'topic': "${slected_feedback}",
                          'submission_date': DateTime.now(),
                          'description': descrip.text
                        });
                        showAlertDialog(context);
                      }
                    : () {},
                text: "Submit",
              ),
              SizedBox(
                height: heightsize * 0.015,
              ),
              //Recent Feedback Button
              AuthButton(
                buttoncolor: Colors.blueAccent,
                onTap: () {
                  Get.to(() => RecentsView());
                },
                text: "Recent Feedback",
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropDown(list, check) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
