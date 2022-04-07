import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_locator_app/features/presentation/pages/AddTheater.page.dart';
import 'package:movie_locator_app/features/presentation/pages/AdminMovieList.page.dart';
import 'package:movie_locator_app/features/presentation/pages/AdminaddMovie.page.dart';
import 'package:movie_locator_app/features/presentation/pages/ViewTheaters.page.dart';

import 'Home.page.dart';

class AdminPanelPage extends StatelessWidget {
  const AdminPanelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(child: Lottie.asset('assets/admin.json'),
          
          ),
          Row(
            children: [
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                            AdminAddMoviePage(), 'Add Movie')),
                  );
                },
                child: Text('Add Movies'),
                color: Color(0xffB92121),
              )),
              SizedBox(width: 5,),
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                            AdminMovieListPage(), 'Admin Movie List')),
                  );
                },
                child: Text('Movies List'),
                      color: Color(0xffB92121)
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                            AddTheaterPage(), 'Add Theater')),
                  );
                },
                child: Text('Add Theaters'),
                      color: Color(0xffB92121)
              )),
              SizedBox(width: 5,),
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                            TheaterListPage(), 'Theater List')),
                  );
                },
                child: Text('Theater List'),
                      color: Color(0xffB92121)
              ))
            ],
          ),
        ],
      ),
    );
  }
}
