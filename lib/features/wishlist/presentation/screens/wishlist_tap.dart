import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/screen_header.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 24,right: 24,top: 40),
        child: Container(
          color: AppColors.mainColor,
          child: SingleChildScrollView(
            child: Column(
                children: [
                  ScreenHeader(title: 'Wishlist',)
                ],

            ),
          ),
        ),
      ),
    );
  }
}
