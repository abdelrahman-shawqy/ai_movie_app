import 'dart:ui';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/movie_detail/presentation/widget/card_movie_details.dart';
import 'package:flutter/material.dart';



class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key,required this.title,required this.voteAverage,required this.releaseDate,required this.posterPath});
final String title ;
final String voteAverage ;
final String releaseDate ;
final String posterPath ;
  static const Color bgColor = Color(0xFF1C1B2E);
  static const Color placeholderColor = Color(0xFF2B2940);
  static const Color orange = Color(0xFFFF8A00);
  static const Color cyan = Color(0xFF1FD1DC);
  static const Color star = Color(0xFFFF9A1F);
  static const Color greyText = Color(0xFFA9A9B8);
  static const Color circleBtn = Color(0xFF2A2A40);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardMovieDetails(title: title,voteAverage: voteAverage,releaseDate: releaseDate,posterPath: posterPath,),
            // Story Line
            const SizedBox(height: 28),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Story Line',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFFE6E6EE),
                    fontSize: 17,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text:
                      "For the first time in the cinematic history of Spider-Man, our friendly neighborhood hero's identity is revealed, bringing his Super Hero responsibilities into conflict with his normal life and putting those he cares about most at risk. ",
                    ),
                    TextSpan(
                      text: 'More',
                      style: TextStyle(
                        color: cyan,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 28),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Cast and Crew',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}