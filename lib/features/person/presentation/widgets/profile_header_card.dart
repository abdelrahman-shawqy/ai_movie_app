import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/routing/route.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/profile_colors.dart';
import 'package:flutter/material.dart';


/// Top card showing the user's avatar, name, email and an edit action.
class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({
    super.key,
    required this.name,
    required this.email,
    required this.avatar,
  });

  final String name;
  final String email;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: ProfileColors.background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ProfileColors.cardBorder),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(28),
            child: Image.asset(avatar,height: 54,width: 54,),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium?.copyWith(
                    color: ProfileColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium?.copyWith(
                    color: ProfileColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, Routes.editProfileScreen);
            },
              child: Image.asset(AppImages.iconEdit)),
        ],
      ),
    );
  }
}
