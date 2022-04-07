import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_locator_app/features/domain/entities/theater.entity.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/TheaterBloc/bloc/bloc.dart';

import '../../domain/entities/theaterList.entity.dart';
import '../widgets/theaterCard.widget.dart';

class TheaterListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return BlocBuilder<TheaterBloc, TheaterState>(builder: (context, state) {
      if (state is TheaterListLoading) {
        context.read<TheaterBloc>().add(GetTheaterListEvent());
      } else if (state is TheaterListLoaded) {
        return ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: state.listEntity.theaterList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return TheaterList(
                index: index,
                theaterListEntity: state.listEntity,
              );
            });
      } else if (state is Error) {
        return Container(
          child: Text('Error'),
        );
      }
      return Container(
        child: Text('No data'),
      );
    });
  }
}

class TheaterList extends StatelessWidget {
  const TheaterList({
    Key? key,
    required TheaterListEntity theaterListEntity,
    required int index,
  })  : _theaterList = theaterListEntity,
        _index = index,
        super(key: key);

  final TheaterListEntity _theaterList;
  final int _index;

  @override
  Widget build(BuildContext context) {
    String theaterImage = _theaterList.theaterList[_index].theaterImage!;
    String theaterName = _theaterList.theaterList[_index].theaterName;
    String theaterLocationLink =
        _theaterList.theaterList[_index].theaterLocationLink;
    List<dynamic> availableClasses =
        _theaterList.theaterList[_index].availbleClasses!;
    List<dynamic> showTimeList = _theaterList.theaterList[_index].showEntityList!;

    return Expanded(
        child: TheaterCardWidget(
      theaterEntity: new TheaterEntity(
        theaterLocationLink: theaterLocationLink,
        theaterName: theaterName,
        theaterImage: theaterImage,
        showEntityList: showTimeList,
        availbleClasses: availableClasses,
      ),
    ));
  }
}
