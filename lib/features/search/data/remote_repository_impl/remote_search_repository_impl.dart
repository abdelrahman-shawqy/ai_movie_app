import 'package:ai_movie_app/core/error/failure.dart';
import 'package:ai_movie_app/features/search/data/models/person_credits_model.dart';
import 'package:ai_movie_app/features/search/data/models/search_by_actor_model.dart';
import 'package:ai_movie_app/features/search/data/models/search_by_movie_model.dart';
import 'package:ai_movie_app/features/search/data/remote_data_source/remote_search_data_source.dart';
import 'package:ai_movie_app/features/search/domain/remote_repository/remote_search_repository.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class RemoteSearchRepositoryImpl extends RemoteSearchRepository{
  RemoteSearchRepositoryImpl(this.remoteSearchDataSource);
  final RemoteSearchDataSource remoteSearchDataSource ;
  @override
  Future<Either<Failure,SearchByMovieModel>>getSearchByMovieResponse(String searchWord )async{
    try{
      var response = await remoteSearchDataSource.getSearchByMovieResponse(searchWord);
      var data =  SearchByMovieModel.fromJson(response.data);

      return Right(data) ;
    }on DioException catch(e){
      print('Exception from RemoteSearchRepositoryImpl getSearchByMovieResponse ${e.toString()}  ');
      print('Exception from RemoteSearchRepositoryImpl getSearchByMovieResponse,the error message is  ${e.message}  ');
      return Left(Failure(e.message ?? 'Something get wrong getSearchByMovieResponse'));
    }
  }
  @override
  Future<Either<Failure,SearchByActorModel>>getSearchByActorResponse(String searchWord )async{
    try{
      var response =await  remoteSearchDataSource.getSearchByActorResponse(searchWord);
      var searchByActorData = SearchByActorModel.fromJson(response.data);
      return Right(searchByActorData) ;
    }on DioException catch(e){
      print('Exception from RemoteSearchRepositoryImpl getSearchByActorResponse = ${e.toString()}  ');
      print('Exception from RemoteSearchRepositoryImpl getSearchByActorResponse ,the error message is  ${e.message}  ');
      return Left(Failure(e.message ?? 'Something get wrong getSearchByActorResponse'));
    }
  }
  @override
  Future<Either<Failure,PersonCreditsResponse>>getPersonCreditsResponse(String personId )async{
    try{
      var response =await  remoteSearchDataSource.getPersonCreditsResponse(personId);
      var personCreditsData = PersonCreditsResponse.fromJson(response.data);
      return Right(personCreditsData) ;
    }on DioException catch(e){
      print('Exception from RemoteSearchRepositoryImpl getPersonCreditsResponse = ${e.toString()}  ');
      print('Exception from RemoteSearchRepositoryImpl getPersonCreditsResponse ,the error message is  ${e.message}  ');
      return Left(Failure(e.message ?? 'Something get wrong getPersonCreditsResponse'));
    }
  }

}