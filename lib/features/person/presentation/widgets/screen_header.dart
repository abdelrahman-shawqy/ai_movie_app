import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';


/// Header used by simple sub-screens: rounded back button on the left and a
/// centered title.
class ScreenHeader extends StatelessWidget {
  const ScreenHeader({
    super.key,
    required this.title,
  });

  final String title;

  /// Defaults to popping the current route.

  static const double _buttonSize = 40;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _buttonSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: Navigator.of(context).pop,
              customBorder: const CircleBorder(),
              child: Image.asset(AppImages.iconBack),
            ),
          ),
          Text(title, style: AppTextStyle.H4Semibold600S16White),
        ],
      ),
    );
  }
}
