import 'package:flutter/material.dart';

class BNBItemWidget {
  final String label;
  final IconData icon;
  final Function onPressed;

  const BNBItemWidget(
      {required this.icon, required this.label, required this.onPressed});

  String getLabel() {
    return this.label;
  }

  IconData getIcon() {
    return this.icon;
  }

  Function getFunction() {
    return this.onPressed;
  }
}
