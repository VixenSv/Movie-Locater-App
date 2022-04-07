import 'package:equatable/equatable.dart';
import 'package:movie_locator_app/features/data/models/theater.model.dart';


import '../../data/models/movie.model.dart';

class TheaterEntity extends Equatable {
  final String theaterName;
  final String? theaterImage;
  final List<dynamic>? availbleClasses;
  final String theaterLocationLink;
  final List<dynamic>? showEntityList;
  final String theaterId;


  TheaterEntity(
      {required this.theaterId,
        required this.theaterName,
       this.theaterImage,
       this.availbleClasses,
      required this.theaterLocationLink,
       this.showEntityList})
      : super();

  static Future<TheaterEntity> toTheaterEntity(TheaterModel theaterModel) async {
    return await TheaterEntity(
      theaterId: theaterModel.theaterId,
        theaterName: theaterModel.theaterName,
        availbleClasses: theaterModel.availbleClasses,
        theaterLocationLink: theaterModel.theaterLocationLink,
        showEntityList: theaterModel.showEntityList,
        theaterImage: theaterModel.theaterImage);
  }

  static Future<TheaterModel> fromTheaterEntity(
      TheaterEntity theaterEntity) async {
    return await TheaterModel(
      theaterId: theaterEntity.theaterId,
        theaterName: theaterEntity.theaterName,
        availbleClasses: theaterEntity.availbleClasses!,
        theaterLocationLink: theaterEntity.theaterLocationLink,
        showEntityList: theaterEntity.showEntityList!,
        theaterImage: theaterEntity.theaterImage!);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        this.theaterName,
        this.theaterImage,
        this.theaterLocationLink,
        this.availbleClasses,
        this.showEntityList
      ];


}
