import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/TheaterBloc/bloc/theater_event.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/TheaterBloc/bloc/theater_state.dart';


class TheaterBloc extends Bloc<TheaterEvent, TheaterState> {
  TheaterBloc() : super(TheaterInitial()) {
    on<TheaterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
