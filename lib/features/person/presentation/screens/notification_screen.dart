import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/screen_header.dart';
import 'package:flutter/material.dart';

import '../widgets/notification_settings_card.dart';

/// UI-only notification settings. No permissions, services or persistence.
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key, this.onBack});

  final VoidCallback? onBack;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _showNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 12),
              ScreenHeader(title: 'Notification',),
              const SizedBox(height: 20),
              NotificationSettingsCard(
                showNotifications: _showNotifications,
                onChanged: (value) =>
                    setState(() => _showNotifications = value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
