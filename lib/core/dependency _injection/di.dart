import 'package:ai_movie_app/core/network/api_helper.dart';
import 'package:ai_movie_app/core/network/constant.dart';
import 'package:ai_movie_app/features/home/data/remote_data_source/remote_home_data_source.dart';
import 'package:ai_movie_app/features/home/data/remote_data_source/remote_home_data_source_impl.dart';
import 'package:ai_movie_app/features/home/data/remote_repository_impl/remote_home_repository_impl.dart';
import 'package:ai_movie_app/features/home/domain/remote_repository/remote_home_repository.dart';
import 'package:ai_movie_app/features/home/domain/use_case/home_use_case.dart';
import 'package:ai_movie_app/features/home/presentation/controller/most_popular_movies/most_popular_movies_cubit.dart';
import 'package:ai_movie_app/features/home/presentation/controller/movie_list/movie_list_cubit.dart';
import 'package:ai_movie_app/features/home/presentation/controller/trending_movies/trending_movies_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void configureDependencies (){
getIt.registerLazySingleton<Dio>(() =>Dio(
  BaseOptions(
    baseUrl:'https://api.themoviedb.org/3',
    headers: {
      'Authorization': 'Bearer $accessTokenAuth',
      'accept':'application/json'
    },
    sendTimeout:const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    connectTimeout: const Duration(seconds: 10),
  )
) ,);
getIt.registerLazySingleton<ApiHelper>(() => ApiHelper(getIt<Dio>()),);
getIt.registerLazySingleton<RemoteHomeDataSource>(() => RemoteHomeDataSourceImpl(getIt<ApiHelper>()),);
getIt.registerLazySingleton<RemoteHomeRepository>(() => RemoteHomeRepositoryImpl(getIt<RemoteHomeDataSource>()),);
getIt.registerLazySingleton<HomeUseCase>(() => HomeUseCase(getIt<RemoteHomeRepository>()),);
getIt.registerLazySingleton<MovieListCubit>(() => MovieListCubit(getIt<HomeUseCase>()),);
getIt.registerLazySingleton<MostPopularMoviesCubit>(() => MostPopularMoviesCubit(getIt<HomeUseCase>()),);
getIt.registerLazySingleton<TrendingMoviesCubit>(() => TrendingMoviesCubit(getIt<HomeUseCase>()),);

}