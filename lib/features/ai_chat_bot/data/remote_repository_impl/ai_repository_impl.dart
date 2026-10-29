import 'package:ai_movie_app/core/error/failure.dart';
import 'package:ai_movie_app/features/ai_chat_bot/data/models/gemini_interaction_model.dart';
import 'package:ai_movie_app/features/ai_chat_bot/data/remote_data_source/ai_remote_data_source.dart';
import 'package:ai_movie_app/features/ai_chat_bot/domain/remote_repository/ai_repository.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class AiRepositoryImpl implements AiRepository {
  AiRepositoryImpl(this.aiRemoteDataSource);

  final AiRemoteDataSource aiRemoteDataSource;

  @override
  Future<Either<Failure, String>> sendMessage(String message) async {
    try {
      final response = await aiRemoteDataSource.sendMessage(message: message);
      final interaction = GeminiInteractionModel.fromJson(response.data);

      if (!interaction.isCompleted) {
        return Left(Failure(
            'The assistant could not complete the response. Please try again.'));
      }
      final answer = interaction.assistantText;
      if (answer.isEmpty) {
        return Left(Failure('The assistant returned an empty response.'));
      }
      return Right(answer);
    } on DioException catch (e) {
      return Left(Failure(_dioErrorMessage(e)));
    } on FormatException {
      return Left(Failure('Received an unexpected response from the assistant.'));
    } catch (_) {
      return Left(Failure('Something went wrong. Please try again.'));
    }
  }

  /// Friendly message only: never includes headers, the key or raw bodies.
  String _dioErrorMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'The request timed out. Please try again.';
      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your network.';
      case DioExceptionType.badResponse:
        switch (e.response?.statusCode) {
          case 400:
            return 'The request was rejected (400). Please check the model name or message.';
          case 401:
          case 403:
            return 'Access denied. The API key is invalid or not allowed.';
          case 404:
            return 'The AI service or model was not found (404).';
          case 429:
            return 'Too many requests. Please wait a moment and try again.';
          case 500:
          case 502:
          case 503:
            return 'The AI service is having problems. Please try again later.';
          default:
            return 'Request failed (${e.response?.statusCode}).';
        }
      case DioExceptionType.cancel:
        return 'The request was cancelled.';
      default:
        return 'Network error. Please try again.';
    }
  }
}
