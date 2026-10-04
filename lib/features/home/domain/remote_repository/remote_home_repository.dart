import 'package:ai_movie_app/core/error/failure.dart';
import 'package:ai_movie_app/features/home/data/models/most_popular_movies_model.dart';
import 'package:ai_movie_app/features/home/data/models/movie_list_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class RemoteHomeRepository {
  // TODO: convert Either<Failure ,MovieListModel > to movie entity to hide orignal data
  // TODO: the domain leyar see MovieListModel
  Future<Either<Failure ,MovieListModel >> getMovieListData();
  Future<Either<Failure,MostPopularMoviesModel>> getMostPopularMoviesData(int movieListId ) ;
}