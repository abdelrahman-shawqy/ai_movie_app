import 'package:ai_movie_app/core/dependency%20_injection/di.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/ai_chat_bot/presentation/controller/ai_cubit.dart';
import 'package:ai_movie_app/features/ai_chat_bot/presentation/widgets/chat_message_bubble.dart';
import 'package:ai_movie_app/features/ai_chat_bot/presentation/widgets/custom_text_field.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiScreen extends StatefulWidget {
  const AiScreen({super.key});

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  late TextEditingController controller;
  late ScrollController scrollController;

  @override
  void initState() {
    controller = TextEditingController();
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !scrollController.hasClients) return;
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AiCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: BlocConsumer<AiCubit, AiState>(
              listener: (context, state) => _scrollToBottom(),
              builder: (context, state) {
                final isLoading = state is AiLoading;
                final hasError = state is AiError;
                // Extra row at the end for the loader / error message.
                final extra = (isLoading || hasError) ? 1 : 0;
                return Column(
                  children: [
                    const SizedBox(height: 24),
                    const ScreenHeader(title: 'Chat Bot'),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        itemCount: state.messages.length + extra,
                        itemBuilder: (context, index) {
                          if (index < state.messages.length) {
                            final message = state.messages[index];
                            return ChatMessageBubble(
                              text: message.text,
                              isUser: message.isUser,
                            );
                          }
                          if (state is AiError) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                state.errorMessage,
                                style: AppTextStyle.h5Medium500S14
                                    .copyWith(color: AppColors.secondaryOrange),
                              ),
                            );
                          }
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.primaryBlueAccent,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: CustomTextFieldChat(
                        controller: controller,
                        isSending: isLoading,
                        send: () {
                          final text = controller.text.trim();
                          if (text.isEmpty || isLoading) return;

                          controller.clear();
                          context.read<AiCubit>().sendMessage(text);

                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
