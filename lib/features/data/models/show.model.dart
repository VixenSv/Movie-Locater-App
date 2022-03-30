import 'package:movie_locator_app/features/domain/entities/show.entity.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';

import '../../domain/entities/movie.entity.dart';
import 'package:image_picker/image_picker.dart';

class ShowModel extends ShowEntity {
  ShowModel({
    required String showTime,
    required MovieEntity movieEntity,
  }) : super(movieEntity: movieEntity, showTime: showTime);

  //method to convert picked Image into a image model
  static Future<ShowModel> fromFile(
      {required String showTime, required MovieEntity movieEntity}) async {
    return await ShowModel(movieEntity: movieEntity, showTime: showTime);
  }
}
