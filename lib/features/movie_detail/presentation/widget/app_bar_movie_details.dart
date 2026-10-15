import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/features/movie_detail/presentation/widget/love_widget.dart';
import 'package:flutter/material.dart';

class AppBarMovieDetails extends StatelessWidget {
  const AppBarMovieDetails({super.key,required this.title});
  final String title ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
              child: Image.asset(AppImages.iconBack)),

           Text(
             title,
            style:  AppTextStyle.H4Semibold600S16White,
          ),
          LoveWidget(),
        ],
      ),
    );
  }
}
