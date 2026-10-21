import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/profile_colors.dart';
import 'package:flutter/material.dart';


/// Bordered card with the "Show Notifications" switch and a static
/// "Exceptions" label.
class NotificationSettingsCard extends StatelessWidget {
  const NotificationSettingsCard({
    super.key,
    required this.showNotifications,
    required this.onChanged,
  });

  final bool showNotifications;
  final ValueChanged<bool> onChanged;

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
           Text(
            'Messages Notifications',
            style: AppTextStyle.H6Medium500S12,
          ),
          const SizedBox(height: 6),
          Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: ProfileColors.divider)),
            ),
            child: Row(
              children: [
                 Expanded(
                  child: Text(
                    'Show Notifications',
                    style: AppTextStyle.H4Medium500S16,
                  ),
                ),
                Switch(
                  value: showNotifications,
                  onChanged: onChanged,
                  activeThumbColor: Colors.white,
                  activeTrackColor: ProfileColors.accent,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: ProfileColors.iconCircle,
                  trackOutlineColor:
                      const WidgetStatePropertyAll(Colors.transparent),
                ),
              ],
            ),
          ),
          Container(
            height: 48,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child:  Text(
              'Exceptions',
              style: AppTextStyle.H4Medium500S16,
            ),
          ),
        ],
      ),
    );
  }
}
