import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/profile_colors.dart';
import 'package:flutter/material.dart';


/// Modal confirmation shown before logging out. Not a route/screen.
class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({super.key, this.onLogout});

  /// Called when the dialog's "Log Out" button is pressed.
  final VoidCallback? onLogout;

  /// Opens the dialog over the current screen.
  static Future<void> show(BuildContext context, {VoidCallback? onLogout}) {
    return showDialog<void>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (_) => LogoutConfirmationDialog(onLogout: onLogout),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.PrimarySoft,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.questionIconIm, height: 96),
            const SizedBox(height: 16),
             Text(
              'Are you sure ?',
              textAlign: TextAlign.center,
              style: AppTextStyle.simiBold600S18,
            ),
            const SizedBox(height: 8),
             Text(
              'Ullamcorper imperdiet urna id non sed est sem. '
              'Rhoncus amet, enim purus gravida donec aliquet.',
              textAlign: TextAlign.center,
              style: AppTextStyle.H6Medium500S12,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: OutlinedButton(
                      onPressed: onLogout,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: ProfileColors.accent,
                        side: const BorderSide(color: ProfileColors.accent),
                        shape: const StadiumBorder(),
                      ),
                      child:  Text('Log Out',style: AppTextStyle.poppinsRegular400S16primaryBlueAccent,),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ProfileColors.accent,
                        foregroundColor: AppColors.mainColor,
                        elevation: 0,
                        shape: const StadiumBorder(),
                      ),
                      child:  Text('Cancel',style: AppTextStyle.poppinsRegular400S16whiteColor,),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
