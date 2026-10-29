import 'package:ai_movie_app/core/error/failure.dart';
import 'package:ai_movie_app/features/ai_chat_bot/domain/remote_repository/ai_repository.dart';
import 'package:fpdart/fpdart.dart';

class SendMessageUseCase {
  SendMessageUseCase(this.aiRepository);

  final AiRepository aiRepository;

  Future<Either<Failure, String>> sendMessage(String message) async {
    return await aiRepository.sendMessage(message);
  }
}
