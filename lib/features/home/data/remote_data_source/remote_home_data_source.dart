
import 'package:dio/dio.dart';

abstract class RemoteHomeDataSource {
  Future<Response>getMovieListResponse();

}