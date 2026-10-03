import 'package:dio/dio.dart';

class ApiHelper {
  ApiHelper(this.dio);

  final Dio dio;

  Future<Response> getData({required String endPoint, Map<String, dynamic>? queryParameters}) async{
    if(queryParameters == null||queryParameters.isEmpty){
      return await dio.get(endPoint);
    }
    else{
      return await  dio.get(endPoint, queryParameters: queryParameters);

    }
  }
}
