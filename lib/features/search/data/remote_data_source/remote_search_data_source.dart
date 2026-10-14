import 'package:dio/dio.dart';

abstract class RemoteSearchDataSource {


  Future<Response<dynamic>> getSearchByMovieResponse(String searchWord) ;
}