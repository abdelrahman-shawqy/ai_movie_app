part of 'ai_cubit.dart';

/// A single chat message shown in the conversation.
class ChatMessage extends Equatable {
  const ChatMessage({required this.text, required this.isUser});

  final String text;
  final bool isUser;

  @override
  List<Object?> get props => [text, isUser];
}

/// Every state carries the whole conversation so nothing is lost on
/// loading or error.
@immutable
sealed class AiState extends Equatable {
  const AiState(this.messages);

  final List<ChatMessage> messages;

  @override
  List<Object?> get props => [messages];
}

final class AiInitial extends AiState {
  const AiInitial() : super(const []);
}

final class AiLoading extends AiState {
  const AiLoading(super.messages);
}

final class AiSuccess extends AiState {
  const AiSuccess(super.messages);
}

final class AiError extends AiState {
  const AiError(super.messages, this.errorMessage);

  final String errorMessage;

  @override
  List<Object?> get props => [messages, errorMessage];
}
