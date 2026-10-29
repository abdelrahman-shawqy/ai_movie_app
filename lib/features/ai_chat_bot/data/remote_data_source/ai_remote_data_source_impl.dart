import 'package:ai_movie_app/core/network/api_helper.dart';
import 'package:ai_movie_app/features/ai_chat_bot/data/remote_data_source/ai_remote_data_source.dart';
import 'package:dio/dio.dart';

class AiRemoteDataSourceImpl implements AiRemoteDataSource {
  AiRemoteDataSourceImpl(this.apiHelper);

  /// Must be the Gemini ApiHelper (see di.dart), not the TMDB one.
  final ApiHelper apiHelper;

  static const String _model = 'gemini-3.5-flash-lite';

  @override
  Future<Response<dynamic>> sendMessage({required String message}) async {
    // Base URL (https://generativelanguage.googleapis.com/v1beta/) and the
    // x-goog-api-key / Content-Type headers come from the Gemini Dio.
    // DioExceptions are intentionally not caught here: the repository maps
    // them to a Failure. Nothing is logged so the key can never leak.
    return await apiHelper.postData(
      endPoint: 'interactions',
      data: {'model': _model, 'input': message},
    );
  }
}
