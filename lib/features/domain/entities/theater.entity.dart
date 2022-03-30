import 'package:equatable/equatable.dart';
import 'package:movie_locator_app/features/data/models/theater.model.dart';
import 'package:movie_locator_app/features/domain/entities/show.entity.dart';

import '../../data/models/movie.model.dart';

class TheaterEntity extends Equatable {
  final String theaterName;
  final int theaterId;
  final String theaterImage;
  final List<dynamic> availbleClasses;
  final String theaterLocationLink;
  final List<dynamic> showEntityList;

  TheaterEntity(
      {required this.theaterName,
      required this.theaterId,
      required this.theaterImage,
      required this.availbleClasses,
      required this.theaterLocationLink,
      required this.showEntityList})
      : super();

  static Future<TheaterEntity> toImageEntity(TheaterModel theaterModel) async {
    return await TheaterEntity(
        theaterName: theaterModel.theaterName,
        theaterId: theaterModel.theaterId,
        availbleClasses: theaterModel.availbleClasses,
        theaterLocationLink: theaterModel.theaterLocationLink,
        showEntityList: theaterModel.showEntityList,
        theaterImage: theaterModel.theaterImage);
  }

  static Future<TheaterModel> fromMovieEntity(
      TheaterEntity theaterEntity) async {
    return await TheaterModel(
        theaterName: theaterEntity.theaterName,
        theaterId: theaterEntity.theaterId,
        availbleClasses: theaterEntity.availbleClasses,
        theaterLocationLink: theaterEntity.theaterLocationLink,
        showEntityList: theaterEntity.showEntityList,
        theaterImage: theaterEntity.theaterImage);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        this.theaterId,
        this.theaterName,
        this.theaterImage,
        this.theaterLocationLink,
        this.availbleClasses,
        this.showEntityList
      ];
}
