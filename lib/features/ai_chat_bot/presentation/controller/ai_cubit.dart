import 'package:ai_movie_app/features/ai_chat_bot/domain/use_case/send_message_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'ai_state.dart';

class AiCubit extends Cubit<AiState> {
  AiCubit(this.sendMessageUseCase) : super(const AiInitial());

  final SendMessageUseCase sendMessageUseCase;

  Future<void> sendMessage(String text) async {
    final message = text.trim();
    if (message.isEmpty) return;
    // Ignore taps while a request is already running.
    if (state is AiLoading) return;

    final withUserMessage = [
      ...state.messages,
      ChatMessage(text: message, isUser: true),
    ];
    emit(AiLoading(withUserMessage));

    final result = await sendMessageUseCase.sendMessage(message);
    if (isClosed) return;

    result.fold(
      (failure) => emit(AiError(withUserMessage, failure.errorMessage)),
      (answer) => emit(AiSuccess([
        ...withUserMessage,
        ChatMessage(text: answer, isUser: false),
      ])),
    );
  }
}
