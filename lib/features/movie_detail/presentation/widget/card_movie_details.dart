import 'dart:math';
import 'dart:ui';

import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/movie_detail/presentation/widget/app_bar_movie_details.dart';
import 'package:ai_movie_app/features/movie_detail/presentation/widget/rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardMovieDetails extends StatelessWidget {
  const CardMovieDetails({super.key,required this.title,required this.voteAverage,required this.releaseDate,required this.posterPath});
  final String title ;
  final String voteAverage ;
  final String releaseDate ;
  final String posterPath ;
  static const String ppppp = 'assets/images/test.png';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       CachedNetworkImage(
         height: 630,
           width: double.infinity,
           fit: BoxFit.fill,
           imageUrl: posterPath,
         errorWidget: (_,_,_)=>Image.asset(AppImages.unavailableErrorImage,height: 630,
           width: double.infinity,fit: BoxFit.fill,),
       ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(color: AppColors.mainColor.withOpacity(0.30)),
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarMovieDetails(title:title),

              const SizedBox(height: 40),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    height: 300,
                    width: 220,
                    fit: BoxFit.fill,
                    imageUrl: posterPath,
                    errorWidget: (_,_,_)=>Image.asset(AppImages.unavailableErrorImage,height: 300,
                      width: 220,fit: BoxFit.fill,),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.calendar_month, color: AppColors.grayColor, size: 20),
                  const SizedBox(width: 6),
                   Text(
                     releaseDate,
                    style: AppTextStyle.h7Medium500s10GrayColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    width: 1,
                    height: 18,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    color: AppColors.grayColor,
                  ),
                  const Icon(Icons.access_time_filled, color: AppColors.grayColor, size: 20),
                  const SizedBox(width: 6),
                   Text(
                    '148 Minutes',
                    style: AppTextStyle.h7Medium500s10GrayColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    width: 1,
                    height: 18,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    color: AppColors.grayColor,
                  ),
                  const Icon(Icons.movie, color: AppColors.grayColor, size: 20),
                  const SizedBox(width: 6),
                  const Text(
                    'Action',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: AppColors.grayColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              RatingWidget(voteAverage:voteAverage ,),

              const SizedBox(height: 22),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 115,
                      height: 48,
                      decoration: BoxDecoration(
                        color:  AppColors.secondaryOrange,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.play_arrow, color: Colors.white, size: 26),
                          SizedBox(width: 8),
                          Text(
                            'Play',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: AppColors.mainColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.download, color:  AppColors.secondaryOrange, size: 26),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color:  AppColors.mainColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.open_in_new, color:  AppColors.primaryBlueAccent, size: 24),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
