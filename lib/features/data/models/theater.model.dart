
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';

import '../../domain/entities/movie.entity.dart';
import 'package:image_picker/image_picker.dart';

class TheaterModel extends TheaterEntity {
  TheaterModel({
    required String theaterName,
    required int theaterId,
    required String theaterImage,
    required List<dynamic> availbleClasses,
    required String theaterLocationLink,
    required List<String> showEntityList,
  }) : super(
            availbleClasses: availbleClasses,
            showEntityList: showEntityList,
            theaterId: theaterId,
            theaterImage: theaterImage,
            theaterLocationLink: theaterLocationLink,
            theaterName: theaterName);

  //method to convert picked Image into a image model
  static Future<TheaterModel> fromFile(
    String theaterName,
    int theaterId,
    String theaterImage,
    List<dynamic> availbleClasses,
    String theaterLocationLink,
    List<String> showEntityList,
  ) async {
    return await TheaterModel(
        availbleClasses: availbleClasses,
        showEntityList: showEntityList,
        theaterId: theaterId,
        theaterImage: theaterImage,
        theaterLocationLink: theaterLocationLink,
        theaterName: theaterName);
  }
}
