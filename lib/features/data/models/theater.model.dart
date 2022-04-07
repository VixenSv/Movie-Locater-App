
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';

import '../../domain/entities/movie.entity.dart';
import 'package:image_picker/image_picker.dart';

class TheaterModel extends TheaterEntity {
  TheaterModel({
    required String theaterId,
    required String theaterName,
    required String theaterImage,
    required List<dynamic> availbleClasses,
    required String theaterLocationLink,
    required List<dynamic> showEntityList,

  }) : super(
            theaterId: theaterId,
            availbleClasses: availbleClasses,
            showEntityList: showEntityList,
            theaterImage: theaterImage,
            theaterLocationLink: theaterLocationLink,
            theaterName: theaterName);

  //method to convert picked Image into a image model
  static Future<TheaterModel> fromFile(
    String theaterName,
    String theaterId,
    String theaterImage,
    List<dynamic> availbleClasses,
    String theaterLocationLink,
    List<dynamic> showEntityList,
  ) async {
    return await TheaterModel(
        theaterId: theaterId,
        availbleClasses: availbleClasses,
        showEntityList: showEntityList,
        theaterImage: theaterImage,
        theaterLocationLink: theaterLocationLink,
        theaterName: theaterName);
  }
}
