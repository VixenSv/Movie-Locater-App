import 'package:get_it/get_it.dart';
import 'package:movie_locator_app/features/data/datasources/remote.datasource.dart';
import 'package:movie_locator_app/features/domain/irepositories/movieLocator.repository.dart';
import 'package:movie_locator_app/features/domain/usecases/getMovieList.usecase.dart';
import 'package:movie_locator_app/features/presentation/bloc/bloc/bloc.dart';

import 'features/data/implrepositories/movieLocator.repository.impl.dart';

final sl = GetIt.instance;

Future<void>? init() {
  //bloc
  sl.registerFactory(() => MovielocatorblocBloc(getMovieList: sl()));

  //usecase
  sl.registerLazySingleton(() => GetMovieList(sl()));

  //repository
  sl.registerLazySingleton<MovieLocatorRepository>(
      () => MovieLocatorRepositoryImpl(remoteDataSource: sl()));

  //datasource
  // sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
}
