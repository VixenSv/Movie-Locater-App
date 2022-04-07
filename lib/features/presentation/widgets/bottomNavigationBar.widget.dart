import 'package:flutter/material.dart';

import 'bottomNavBarItem.widget.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final itemList;
  const BottomNavigationBarWidget({ Key? key, this.itemList})
      : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState(itemList: this.itemList);
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  var itemList;
  _BottomNavigationBarWidgetState({this.itemList});
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xff282828),
      child: Container(
        padding: EdgeInsets.only(top: 10.0),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildBNBItems(this.itemList),
        ),
      ),
    );
  }
}

List<Widget> buildBNBItems(List dataSet) {
  return dataSet
      .map((e) => BottomNavBarItemWidget(
            icon: e.getIcon(),
            label: e.getLabel(),
            onPress: e.getFunction(),
            event: e.getEvent(),
          ))
      .toList();
}
