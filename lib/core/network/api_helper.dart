import 'package:dio/dio.dart';

class ApiHelper {
  ApiHelper(this._dio);

  final Dio _dio;

  Future<Response> getData({required String endPoint, Map<String, dynamic>? queryParameters}) async{
    if(queryParameters == null||queryParameters.isEmpty){
      return await _dio.get(endPoint);
    }
    else{
      return await  _dio.get(endPoint, queryParameters: queryParameters);

    }
  }
}
