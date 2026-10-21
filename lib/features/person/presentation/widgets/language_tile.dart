import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/profile_colors.dart' show ProfileColors;
import 'package:flutter/material.dart';


/// One language row: name on the left, cyan check on the right when selected.
class LanguageTile extends StatelessWidget {
  const LanguageTile({
    super.key,
    required this.language,
    required this.isSelected,
    this.onTap,
    this.showDivider = true,
  });

  final String language;
  final bool isSelected;
  final ValueChanged<String>? onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap == null ? null : () => onTap!(language),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          border: showDivider
              ? const Border(
                  bottom: BorderSide(color: ProfileColors.divider),
                )
              : null,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                language,
                style: AppTextStyle.H4Medium500S16,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_rounded,
                color: ProfileColors.accent,
                size: 22,
              ),
          ],
        ),
      ),
    );
  }
}
