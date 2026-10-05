import 'package:ai_movie_app/core/error/failure.dart';
import 'package:ai_movie_app/features/home/data/models/most_popular_movies_model.dart';
import 'package:ai_movie_app/features/home/data/models/movie_list_model.dart';
import 'package:ai_movie_app/features/home/data/models/trending_movies_model.dart';
import 'package:ai_movie_app/features/home/domain/remote_repository/remote_home_repository.dart';
import 'package:fpdart/fpdart.dart';

class HomeUseCase {
  HomeUseCase(this.remoteHomeRepository);
  final RemoteHomeRepository remoteHomeRepository ;
  Future<Either<Failure, MovieListModel>>callMovieList()async {
    return await remoteHomeRepository.getMovieListData();
  }
  Future<Either<Failure, MostPopularMoviesModel>>callMostPopularMoviesData(int movieListId )async{
    return  await remoteHomeRepository.getMostPopularMoviesData(movieListId);
  }

  Future<Either<Failure, TrendingMoviesModel>> callTrendingMoviesData() async{
    return await remoteHomeRepository.getTrendingMoviesData() ;
  }

}