import 'package:ai_movie_app/core/network/api_helper.dart';
import 'package:ai_movie_app/features/search/data/remote_data_source/remote_search_data_source.dart';
import 'package:dio/dio.dart';

class RemoteSearchDataSourceImpl extends RemoteSearchDataSource{
  RemoteSearchDataSourceImpl(this.apiHelper);

  final ApiHelper apiHelper;
  @override
  Future<Response<dynamic>> getSearchByMovieResponse(String searchWord) async {
    try {
      return await apiHelper.getData(
        endPoint: '/search/movie',
        queryParameters: {'query': searchWord},
      );
    } on DioException catch (e) {
      print(
        '##### There are error from RemoteSearchDataSourceImpl / getSearchByMovieResponse as error object = ${e.error.toString()}',
      );
      print(
        '##### There are error from RemoteSearchDataSourceImpl / getSearchByMovieResponse as error message =  ${e.message}',
      );
      rethrow;
    }
  }
  @override
  Future<Response<dynamic>>getSearchByActorResponse(String searchWord)async{
    try{
      return await apiHelper.getData(endPoint: '/search/person',queryParameters: {
        'query' : searchWord
      });
    }on DioException catch(e){
      print(
        '##### There are error from RemoteSearchDataSourceImpl / getSearchByActorResponse error object = ${e.error.toString()}',
      );
      print(
        '##### There are error from RemoteSearchDataSourceImpl / getSearchByActorResponse error message =  ${e.message}',
      );
      rethrow;
    }
  }
}
