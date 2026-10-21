import 'package:flutter/material.dart';

import 'package:ai_movie_app/features/person/presentation/widgets/profile_colors.dart';

/// A single tappable row: circular icon, title and a trailing cyan chevron.
class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.iconColor = ProfileColors.iconMuted,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: const BoxDecoration(
                color: ProfileColors.iconCircle,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Text(
                title,
                style: textTheme.titleSmall?.copyWith(
                  color: ProfileColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: ProfileColors.accent,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
