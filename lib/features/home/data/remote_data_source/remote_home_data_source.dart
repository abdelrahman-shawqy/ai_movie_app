
import 'package:dio/dio.dart';

abstract class RemoteHomeDataSource {
  Future<Response>getMovieListResponse();
  Future<Response> getMostPopularMoviesResponse({ required int movieListId});
  Future<Response<dynamic>> getTrendingMoviesResponse();
}