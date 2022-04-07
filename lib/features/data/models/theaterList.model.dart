import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_locator_app/features/data/models/theater.model.dart';

class TheaterListModel extends Equatable {
  final List<TheaterModel>? theaterList;

  TheaterListModel({this.theaterList}) : super();

  Future<TheaterListModel> toTheaterModel(List<DocumentSnapshot> list) async {
    List<TheaterModel> theaterList = new List.empty(growable: true);

    String theaterName = '';
    String theaterId = '';
    String theaterImage = '';
    String theaterLocationLink = '';
    List<dynamic> availbleClasses = [];
    List<dynamic> showEntityList = [];

    for (DocumentSnapshot i in list) {
       theaterId = i.id;
       theaterName = i.get('theaterName');
       theaterImage = i.get('theaterImage');
       theaterLocationLink = i.get('theaterLocationLink');
       availbleClasses = i.get('availbleClasses');
       showEntityList = i.get('showTimeList');

      theaterList.add(new TheaterModel(
          theaterId: theaterId,
          theaterName: theaterName,
          theaterImage: theaterImage,
          availbleClasses: availbleClasses,
          theaterLocationLink: theaterLocationLink,
          showEntityList: showEntityList));
    }
    return TheaterListModel(theaterList: theaterList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [theaterList];
}
