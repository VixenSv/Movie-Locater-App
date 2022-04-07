import 'package:flutter/material.dart';

class BlueButtonWidget extends StatelessWidget {
  const BlueButtonWidget(
      {Key? key, required this.onPressed, required this.label})
      : super(key: key);

  final onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: this.onPressed,
        color: Colors.lightBlue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Text(
          this.label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
