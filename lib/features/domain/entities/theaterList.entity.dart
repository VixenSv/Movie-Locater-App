import 'package:equatable/equatable.dart';

import '../../data/models/theater.model.dart';
import '../../data/models/theaterList.model.dart';

class TheaterListEntity extends Equatable {
  final List<TheaterModel> theaterList;

  TheaterListEntity({required this.theaterList}) : super();

  static Future<TheaterListEntity> toTheaterListEntity(
      TheaterListModel theaterListModel) async {
    return TheaterListEntity(theaterList: theaterListModel.theaterList!);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [theaterList];
}