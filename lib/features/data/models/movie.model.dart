import '../../domain/entities/movie.entity.dart';
import 'package:image_picker/image_picker.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required int movieId,
    required String movieName,
    required String movieDescription,
    required List<dynamic> theaterIdList,
    required String movieImage,
  }) : super(
            movieID: movieId,
            movieName: movieName,
            movieDescription: movieDescription,
            theatherIdList: theaterIdList,
            movieImage: movieImage);

  //method to convert picked Image into a image model
  static Future<MovieModel> fromFile(
      PickedFile pickedFile,
      String movieName,
      String movieDescription,
      List<int> theaterIdList,
      String movieImage) async {
    return await MovieModel(
        movieName: movieName,
        movieDescription: movieDescription,
        movieImage: pickedFile.path,
        theaterIdList: theaterIdList,
        movieId: 0);
  }
}
