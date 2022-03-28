import 'package:flutter/material.dart';
import 'package:movie_locator_app/features/presentation/widgets/bottomNavigationBar.widget.dart';

import '../widgets/bnbItem.widget.dart';
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
          icon: Icons.list,
          label: 'Movie List',
          onPressed: () => setState(() {
                this.appBarTitle = 'Movie List';
                this.bodyContent = MovieListPage();
              })),
      BNBItemWidget(
          icon: Icons.airplane_ticket,
          label: 'Bookings',
          onPressed: () => setState(() {
                this.appBarTitle = 'Bookings';
                // this.bodyContent = BookingsPage();
              })),
      BNBItemWidget(
          icon: Icons.feedback,
          label: 'Feedbacks',
          onPressed: () => setState(() {
                this.appBarTitle = 'Feedbacks';
                // this.bodyContent = FeedbacksPage();
              })),
      BNBItemWidget(
          icon: Icons.account_circle,
          label: 'Profile',
          onPressed: () => setState(() {
                this.appBarTitle = 'Profile';
                // this.bodyContent = ProfilePage();
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
        child: Center(
          child: this.bodyContent,
        ),
      ),
    );
  }
}
