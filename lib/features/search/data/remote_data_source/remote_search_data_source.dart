import 'package:dio/dio.dart';

abstract class RemoteSearchDataSource {


  Future<Response<dynamic>> getSearchByMovieResponse(String searchWord) ;
  Future<Response<dynamic>>getSearchByActorResponse(String searchWord);
  Future<Response<dynamic>>getPersonCreditsResponse(String personId);
}