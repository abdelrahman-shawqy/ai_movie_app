import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/profile_colors.dart';
import 'package:flutter/material.dart';
/// Rounded, bordered block with a title and a list of rows.
class LanguageSection extends StatelessWidget {
  const LanguageSection({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 14, 12, 4),
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ProfileColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyle.H6Medium500S12),
          const SizedBox(height: 6),
          ...children,
        ],
      ),
    );
  }
}
