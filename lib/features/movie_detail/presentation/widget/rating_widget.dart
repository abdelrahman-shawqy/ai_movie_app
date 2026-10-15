import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key,required this.voteAverage});
  final String voteAverage ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: Color(0xff25283652).withOpacity(0.32),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children:  [
            Icon(Icons.star, color: AppColors.secondaryOrange, size: 20),
            SizedBox(width: 6),
            Text(
              voteAverage,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color:  AppColors.secondaryOrange,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
