import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_locator_app/features/data/datasources/remote.datasource.dart';
import 'package:movie_locator_app/features/data/implrepositories/movieLocator.repository.impl.dart';
import 'package:movie_locator_app/features/domain/irepositories/movieLocator.repository.dart';
import 'package:movie_locator_app/features/domain/usecases/addTheater.usecase.dart';
import 'package:movie_locator_app/features/domain/usecases/addTheaterImage.usecase.dart';
import 'package:movie_locator_app/features/domain/usecases/deleteBooking.usecase.dart';
import 'package:movie_locator_app/features/domain/usecases/getBookingDataFromRef.usecase.dart';
import 'package:movie_locator_app/features/domain/usecases/confirmBooking.usecase.dart';
import 'package:movie_locator_app/features/domain/usecases/getMovieList.usecase.dart';
import 'package:movie_locator_app/features/domain/usecases/getTheaterList.usecase.dart';
import 'package:movie_locator_app/features/domain/usecases/updateBooking.usecase.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/TheaterBloc/bloc/bloc.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bloc.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bookingBloc/bloc/bloc.dart';
import 'features/presentation/bloc/bloc/movielocatorbloc_bloc.dart';
import 'features/presentation/pages/Home.page.dart';
import 'features/presentation/pages/MovieList.page.dart';
import 'injectionContainer.dart' as di;

Future<void> main() async {
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => MovielocatorblocBloc(
                  getMovieList: GetMovieList(MovieLocatorRepositoryImpl(
                      remoteDataSource: RemoteDataSourceImpl())),
                  confirmBooking: ConfirmBooking(MovieLocatorRepositoryImpl(
                      remoteDataSource: RemoteDataSourceImpl())))
                ..add(GetMovieListEvent())),
          BlocProvider(
              create: (context) => BookingBloc(
                  getBookingDataFromRef: GetBookingDataFromRef(
                      MovieLocatorRepositoryImpl(
                          remoteDataSource: RemoteDataSourceImpl())),
                  updateBooking: UpdateBooking(MovieLocatorRepositoryImpl(
                      remoteDataSource: RemoteDataSourceImpl())),
                  deleteBooking: DeleteBooking(MovieLocatorRepositoryImpl(
                      remoteDataSource: RemoteDataSourceImpl())))
                ..add(GetBookingDataEvent(refId: ''))),
          BlocProvider(create: (context) => TheaterBloc(addTheater: AddTheater(
              MovieLocatorRepositoryImpl(
                  remoteDataSource: RemoteDataSourceImpl())
          ),
          addTheaterImage: AddTheaterImage(MovieLocatorRepositoryImpl(
              remoteDataSource: RemoteDataSourceImpl())),
          getTheaterList: GetTheaterList(MovieLocatorRepositoryImpl(
              remoteDataSource: RemoteDataSourceImpl()))))
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Movie Locator',
            initialRoute: '/home',
            routes: {
              '/home': (context) => HomePage(MovieListPage(), 'Movie List')
            }));
  }
}
