import 'package:ai_movie_app/core/error/failure.dart';
import 'package:ai_movie_app/features/search/data/models/person_credits_model.dart';
import 'package:ai_movie_app/features/search/data/models/search_by_actor_model.dart';
import 'package:ai_movie_app/features/search/data/models/search_by_movie_model.dart';
import 'package:ai_movie_app/features/search/domain/remote_repository/remote_search_repository.dart';
import 'package:fpdart/fpdart.dart';

class SearchUseCase {
  SearchUseCase(this.remoteSearchRepository);

  final RemoteSearchRepository remoteSearchRepository ;

  Future<Either<Failure, SearchByMovieModel>> callSearchByMovieResponse(String searchWord)async{
    return await remoteSearchRepository.getSearchByMovieResponse(searchWord);
  }
  Future<Either<Failure, SearchByActorModel>> callSearchByActorResponse(String searchWord)async{
    return await remoteSearchRepository.getSearchByActorResponse(searchWord);
  }
  Future<Either<Failure, PersonCreditsResponse>> callPersonCreditsResponse(String personId)async{
    return await remoteSearchRepository.getPersonCreditsResponse(personId);
  }
}