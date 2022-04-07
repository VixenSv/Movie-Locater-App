import 'package:equatable/equatable.dart';
import 'package:movie_locator_app/features/data/models/show.model.dart';
import 'package:movie_locator_app/features/data/models/theater.model.dart';
import 'package:movie_locator_app/features/domain/entities/movie.entity.dart';

import '../../data/models/movie.model.dart';

class ShowEntity extends Equatable {
  final String showTime;


  ShowEntity(
      {required this.showTime,
      })
      : super();

  static Future<ShowEntity> toImageEntity(ShowModel showModel) async {
    return await ShowEntity(
      showTime: showModel.showTime
    );
  }

  static Future<ShowModel> fromMovieEntity(
      ShowEntity showEntity) async {
    return await ShowModel(
      showTime: showEntity.showTime
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [

        this.showTime,
        
      ];
}
