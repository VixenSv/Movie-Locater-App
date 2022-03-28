import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'movielocatorbloc_event.dart';
import 'movielocatorbloc_state.dart';


class MovielocatorblocBloc
    extends Bloc<MovielocatorblocEvent, MovielocatorblocState> {
  @override
  MovielocatorblocState get initialState => Empty();

  @override
  Stream<MovielocatorblocState> mapEventToState(MovielocatorblocEvent event) async* {

  }
}
