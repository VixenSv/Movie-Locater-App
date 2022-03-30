import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bloc.dart';

class BottomNavBarItemWidget extends StatelessWidget {
  final Function onPress;
  final String label;
  final IconData icon;
  final MovielocatorblocEvent event;
  BottomNavBarItemWidget(
      {Key? key,
      required this.onPress,
      required this.label,
      required this.icon,
      required this.event})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovielocatorblocBloc, MovielocatorblocState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: MaterialButton(
        onPressed: () => {
          context.read<MovielocatorblocBloc>().add(event),
          this.onPress()},
        minWidth: 40,
        child: Column(
          children: <Widget>[
            Icon(
              this.icon,
              color: Colors.red[900],
            ),
            Text(
              this.label,
              style: TextStyle(
                color: Colors.white38,
              ),
            )
          ],
        ),
      ),
    );
  }
}
