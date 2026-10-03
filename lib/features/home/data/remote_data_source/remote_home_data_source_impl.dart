import 'package:ai_movie_app/core/network/api_helper.dart';
import 'package:ai_movie_app/core/network/constant.dart';
import 'package:ai_movie_app/features/home/data/remote_data_source/remote_home_data_source.dart';
import 'package:dio/dio.dart';

class RemoteHomeDataSourceImpl implements RemoteHomeDataSource{
  RemoteHomeDataSourceImpl(this.apiHelper);
  final ApiHelper apiHelper ;
  @override
  Future<Response<dynamic>> getMovieListResponse() async{
    try{
      var movieListDataResponse = await apiHelper.getData(endPoint:'/3/genre/movie/list',queryParameters: {'api_key':apiKey});
      return movieListDataResponse ;
    }on DioException catch (e){
      print('Exception from RemoteHomeDataSourceImpl ${e.toString()}  ');
      print('Exception from RemoteHomeDataSourceImpl ,the error message is  ${e.message}  ');
      rethrow ;
    }
  }


}