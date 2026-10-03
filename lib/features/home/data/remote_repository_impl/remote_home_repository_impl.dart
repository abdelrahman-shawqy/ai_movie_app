import 'package:ai_movie_app/features/home/data/models/movie_list_model.dart';
import 'package:ai_movie_app/core/error/failure.dart';
import 'package:ai_movie_app/features/home/data/remote_data_source/remote_home_data_source.dart';
import 'package:ai_movie_app/features/home/domain/remote_repository/remote_home_repository.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class RemoteHomeRepositoryImpl implements RemoteHomeRepository{
  RemoteHomeRepositoryImpl(this.homeDataSource);
  final RemoteHomeDataSource homeDataSource ;
  // TODO: convert Either<Failure ,MovieListModel > to movie entity to hide orignal data

  @override
  Future<Either<Failure, MovieListModel>> getMovieListData()async {
    try{
      var movieListJsonData = await homeDataSource.getMovieListResponse();
      var movieListModelData = MovieListModel.fromJson(movieListJsonData.data);
      return Right(movieListModelData) ;
    }
    on DioException catch(e){
      // TODO: try to rethrow exception without DioException to access e.message direct
      print('## There Is an Exception From RemoteHomeRepositoryImpl ${e.toString()}') ;
      print('## There Is an Exception From RemoteHomeRepositoryImpl  message ${e.message}') ;
      return Left(Failure(e.message??'Something went wrong From RemoteHomeRepositoryImpl'));
    }
  }
}