import 'package:ai_movie_app/core/error/failure.dart';
import 'package:ai_movie_app/features/search/data/models/search_by_movie_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class RemoteSearchRepository {
  Future<Either<Failure,SearchByMovieModel>>getSearchByMovieResponse(String searchWord );
}