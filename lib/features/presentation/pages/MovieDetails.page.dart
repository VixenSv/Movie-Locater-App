import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bloc.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              BlocBuilder<MovielocatorblocBloc, MovielocatorblocState>(
                builder: (context, state){
                  if(state is Empty) {
                    return Text('Empty!');
                  } else if (state is AddingMovie) {
                    context.read<MovielocatorblocBloc>().add(AddMovieEvent(movieEntity));  
                  } else if (state is MovieDetailsLoaded) {
                    final image = state.detailEntity;
                    return SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Text('Movie details'),
                    );
                  }
                  throw NullThrownError();
                }),
                SizedBox(
                  height: 10.0,
                )
            ]),
        )
      ),
    );
  }
}
