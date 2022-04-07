import 'package:flutter/material.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/movielocatorbloc_event.dart';
import 'package:movie_locator_app/features/presentation/pages/ViewTheaters.page.dart';
import 'package:movie_locator_app/features/presentation/pages/viewBookings.page.dart';
import 'package:movie_locator_app/features/presentation/widgets/bottomNavigationBar.widget.dart';

import '../widgets/bnbItem.widget.dart';
import 'AddTheater.page.dart';
import 'MovieList.page.dart';

class HomePage extends StatefulWidget {
  final initialPage;
  final title;
  HomePage(this.initialPage, this.title) : super();
  @override
  _HomePageState createState() => _HomePageState(this.initialPage, this.title);
}

class _HomePageState extends State<HomePage> {
  Widget bodyContent;
  String appBarTitle;

  _HomePageState(this.bodyContent, this.appBarTitle);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var BNBItemList = [
      BNBItemWidget(
          event: new GoHomeEvent(),
          icon: Icons.list,
          label: 'Movie List',
          onPressed: () => {
                setState(() {
                  this.appBarTitle = 'Movie List';
                  this.bodyContent = MovieListPage();
                })
              }),
      BNBItemWidget(
          event: new GoHomeEvent(),
          icon: Icons.airplane_ticket,
          label: 'Bookings',
          onPressed: () => setState(() {
                this.appBarTitle = 'View Bookings';
                this.bodyContent = ViewBookingPage();
              })),
      BNBItemWidget(
          event: new GoHomeEvent(),
          icon: Icons.feedback,
          label: 'Feedbacks',
          onPressed: () => setState(() {
                this.appBarTitle = 'Feedbacks';
                this.bodyContent = AddTheaterPage();
              })),
      BNBItemWidget(
          event: new GoHomeEvent(),
          icon: Icons.account_circle,
          label: 'Profile',
          onPressed: () => setState(() {
                this.appBarTitle = 'Profile';
                this.bodyContent = TheaterListPage();
              })),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff464646),
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: Color(0xff282828),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        itemList: BNBItemList,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: this.bodyContent,
          ),
        ),
      ),
    );
  }
}
