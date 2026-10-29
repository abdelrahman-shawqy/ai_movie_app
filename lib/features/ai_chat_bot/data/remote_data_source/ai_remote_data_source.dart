import 'package:dio/dio.dart';

abstract class AiRemoteDataSource {
  Future<Response<dynamic>> sendMessage({required String message});
}
