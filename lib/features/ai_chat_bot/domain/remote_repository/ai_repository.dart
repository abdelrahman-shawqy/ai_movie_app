import 'package:ai_movie_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class AiRepository {
  /// Sends [message] and returns the assistant's reply text.
  Future<Either<Failure, String>> sendMessage(String message);
}
