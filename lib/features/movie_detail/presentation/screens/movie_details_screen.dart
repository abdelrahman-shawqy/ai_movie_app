import 'dart:ui';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/movie_detail/presentation/widget/card_movie_details.dart';
import 'package:flutter/material.dart';



class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key,required this.title,required this.voteAverage,required this.releaseDate,required this.posterPath,required this.overview,required this.movieId});
final String title ;
final String voteAverage ;
final String releaseDate ;
final String posterPath ;
final String overview ;
final int movieId ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardMovieDetails(title: title,voteAverage: voteAverage,releaseDate: releaseDate,posterPath: posterPath,movieId: movieId,),
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
              child: Text(
                overview,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color(0xFFE6E6EE),
                  fontSize: 17,
                  height: 1.5,
                ),
              ),

            ),
            const SizedBox(height: 28),

          ],
        ),
      ),
    );
  }
}