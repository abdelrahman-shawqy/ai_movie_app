import 'package:ai_movie_app/core/network/api_helper.dart';
import 'package:ai_movie_app/features/home/data/remote_data_source/remote_home_data_source.dart';
import 'package:dio/dio.dart';

class RemoteHomeDataSourceImpl implements RemoteHomeDataSource{
  RemoteHomeDataSourceImpl(this.apiHelper);
  final ApiHelper apiHelper ;
  @override
  Future<Response<dynamic>> getMovieListResponse() async{
    try{
      var movieListDataResponse = await apiHelper.getData(endPoint:'/genre/movie/list');
      return movieListDataResponse ;
    }on DioException catch (e){
      print('Exception from RemoteHomeDataSourceImpl ${e.toString()}  ');
      print('Exception from RemoteHomeDataSourceImpl ,the error message is  ${e.message}  ');
      rethrow ;
    }
  }

  @override
  Future<Response<dynamic>> getMostPopularMoviesResponse({required int movieListId}) async{
    if(movieListId==1){
      return  await apiHelper.getData(endPoint: '/discover/movie',queryParameters: {
        'sort_by':'popularity.desc',
      });

    }
    else{
      return  await apiHelper.getData(endPoint: '/discover/movie',queryParameters: {
        'sort_by':'popularity.desc',
        'with_genres' :'$movieListId'
      });
    }

  }

  @override
  Future<Response<dynamic>> getTrendingMoviesResponse() async {
    return await apiHelper.getData(endPoint: '/trending/movie/week');
  }


}