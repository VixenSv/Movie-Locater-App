
import 'package:equatable/equatable.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';

import '../../../../../domain/entities/theaterList.entity.dart';

abstract class TheaterState extends Equatable {
  const TheaterState();
  
  @override
  List<Object> get props => [];
}

class TheaterInitial extends TheaterState {
  @override
  List<Object> get props => [];
}

class TheaterEmpty extends TheaterState {
  @override
  List<Object> get props => [];
}

class TheaterPreImageSelect extends TheaterInitial {
  @override
  List<Object> get props => [];
}

class TheaterImageSelected extends TheaterState {
  final imageFile;

  TheaterImageSelected({required this.imageFile});
  @override
  List<Object> get props => [this.imageFile];
}

class TheaterImageSelectionFailed extends TheaterState {

  @override
  List<Object> get props => [];
}

class TheaterDataSaved extends TheaterState {

  @override
  List<Object> get props => [];
}


class TheaterImageSaved extends TheaterState {
  final String url;

  TheaterImageSaved({required this.url});


  @override
  List<Object> get props => [];
}

class TheaterListLoading extends TheaterState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class TheaterListLoaded extends TheaterState {
  final TheaterListEntity listEntity;

  const TheaterListLoaded({required this.listEntity});

  @override
  // TODO: implement props
  List<Object> get props => [listEntity];
}


