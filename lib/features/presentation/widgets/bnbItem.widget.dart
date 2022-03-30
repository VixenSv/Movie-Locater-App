import 'package:flutter/material.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bloc.dart';

class BNBItemWidget {
  final String label;
  final IconData icon;
  final Function onPressed;
  final MovielocatorblocEvent event;
  const BNBItemWidget(
      {required this.icon,
      required this.label,
      required this.onPressed,
      required this.event});

  String getLabel() {
    return this.label;
  }

  IconData getIcon() {
    return this.icon;
  }

  Function getFunction() {
    return this.onPressed;
  }

  MovielocatorblocEvent getEvent() {
    return this.event;
  }
}
