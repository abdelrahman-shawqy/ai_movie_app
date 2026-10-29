import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

/// Chat input. The [controller] is owned by the parent (the parent disposes it).
/// [isSending] disables the Send button while a request is running.
class CustomTextFieldChat extends StatelessWidget {
  const CustomTextFieldChat({
    super.key,
    required this.controller,
    required this.send,
    this.isSending = false,
  });

  final TextEditingController controller;
  final VoidCallback send;
  final bool isSending;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.020),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 2, color: AppColors.grayColor),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // No fixed height: grows from 1 to 5 lines, then scrolls inside.
            TextFormField(
              controller: controller,
              cursorColor: AppColors.whiteGrey,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              minLines: 1,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'You can ask a question.',
                hintStyle: AppTextStyle.h5Medium500S14,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 8),
            // Rebuilds only the button when the text changes.
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: controller,
              builder: (context, value, _) {
                final canSend = !isSending && value.text.trim().isNotEmpty;
                return GestureDetector(
                  onTap: canSend ? send : null,
                  child: Opacity(
                    opacity: canSend ? 1 : 0.4,
                    child: Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlueAccent,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(Icons.arrow_circle_up,
                          color: Colors.white, size: 32),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
