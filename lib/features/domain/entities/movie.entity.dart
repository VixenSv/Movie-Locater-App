import 'package:equatable/equatable.dart';

import '../../data/models/movie.model.dart';

class MovieEntity extends Equatable {
  final String movieName;
  final String movieImage;
  final String movieDescription;
  final int movieID;
  final List<dynamic> theatherIdList;

  MovieEntity(
      {required this.movieImage,
      required this.movieID,
      required this.movieName,
      required this.movieDescription,
      required this.theatherIdList})
      : super();

  static Future<MovieEntity> toImageEntity(MovieModel movieModel) async {
    return await MovieEntity(
        movieDescription: movieModel.movieDescription,
        movieID: movieModel.movieID,
        movieName: movieModel.movieName,
        theatherIdList: movieModel.theatherIdList,
        movieImage: movieModel.movieImage);
  }

  static Future<MovieModel> fromMovieEntity(MovieEntity movieEntity) async {
    return await MovieModel(
        movieId: movieEntity.movieID,
        movieName: movieEntity.movieName,
        movieDescription: movieEntity.movieDescription,
        movieImage: movieEntity.movieImage,
        theaterIdList: movieEntity.theatherIdList);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [this.movieID, this.movieName, this.movieImage, this.movieDescription];
}
