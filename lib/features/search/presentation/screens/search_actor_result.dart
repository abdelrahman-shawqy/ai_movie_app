import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/features/search/presentation/widgets/actors_result_widget.dart';
import 'package:flutter/material.dart';

class SearchActorResult extends StatelessWidget {
   SearchActorResult({super.key, required this.searchWord});
   String searchWord;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.010,),
        Text('Actors', style: AppTextStyle.H4Semibold600S16White),
        SizedBox(height: screenHeight * 0.016,),
        SizedBox(
          height:screenHeight*0.095 ,
          child: PresentActorResultWidget(),
        ),
        SizedBox(height: screenHeight * 0.024,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Most popular',
              style: AppTextStyle.H4Semibold600S16White,
            ),
            Text(
              'See All',
              style: AppTextStyle.H4Semibold500S14,
            ),
          ],
        ),
      ],
    );
  }
}

