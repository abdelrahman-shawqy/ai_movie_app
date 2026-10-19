import 'dart:ui';

import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/routing/route.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/core/utils/api_utils.dart';
import 'package:ai_movie_app/features/home/presentation/controller/trending_movies/trending_movies_cubit.dart';
import 'package:ai_movie_app/features/search/presentation/widgets/moviePremiumStatus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardCustomWidget extends StatelessWidget {
  const CardCustomWidget({
    super.key,
    required this.indexList,
    required this.posterPath,
    required this.voteAverage,
    required this.title,
    required this.genreIds,
    required this.releaseDate,
    required this.overview,
    required this.movieId,
  });

  final int indexList;

  final String posterPath;

  final String voteAverage;

  final String title;

  final String genreIds;

  final String releaseDate;
  final String overview;
  final int movieId;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap : (){
        Navigator.pushNamed(context, Routes.movieDetailsScreen,arguments:{
          'title':  title,
          'voteAverage':voteAverage,
          'releaseDate' : releaseDate,
          'posterPath' : posterPath,
          'overview' : overview,
          'movieId':movieId
        });
      },
      child: SizedBox(
        height: screenHeight * 0.185,
        width: screenWidth * 0.9,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: AlignmentGeometry.topLeft,
              children: [
                CachedNetworkImage(
                  height: screenHeight * 0.185,
                  width: screenWidth * 0.33,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    AppImages.unavailableErrorImage,
                    height: screenHeight * 0.185,
                    width: screenWidth * 0.33,
                    fit: BoxFit.cover,
                  ),
                  imageUrl: posterPath,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(8),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        height: 24,
                        width: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xff25283652).withValues(alpha: 0.32),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(AppImages.starRate),
                              SizedBox(width: 5),
                              Text(
                                '${voteAverage}',
                                style: TextStyle(color: Color(0xffFF8700)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.010,
                  horizontal: screenWidth * 0.045,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MoviePremiumStatus(index: indexList),
                    sizedBoxFun(screenHeight: 6),
                    Text(
                      title,
                      style: AppTextStyle.H4Semibold600S16White,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    sizedBoxFun(screenHeight: 6),
                    Row(
                      children: [
                        Image.asset(AppImages.calendar),
                        sizedBoxFun(screenWidth: 4),
                        Text(
                          '${releaseDate}',
                          style: AppTextStyle.h7Medium500s10GrayColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    sizedBoxFun(screenHeight: 10),
                    Row(
                      children: [
                        Image.asset(AppImages.clock),
                        sizedBoxFun(screenWidth: 4),
                        Text(
                          '148 Minutes',
                          style: AppTextStyle.h7Medium500s10GrayColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                        sizedBoxFun(screenWidth: 12),
                        Image.asset(AppImages.pG13),
                      ],
                    ),
                    sizedBoxFun(screenHeight: 12),
                    Row(
                      children: [
                        Image.asset(AppImages.movieCategoryIcon),
                        sizedBoxFun(screenWidth: 4),

                        Text(
                          '${genreIds}',
                          style: AppTextStyle.h7Medium500s10GrayColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                        sizedBoxFun(screenWidth: 8),

                        Container(
                          height: 16,
                          width: 1,
                          color: AppColors.grayColor,
                        ),
                        sizedBoxFun(screenWidth: 8),

                        Text('Movie', style: AppTextStyle.H6Medium500S12),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  sizedBoxFun({double? screenHeight, double? screenWidth}) {
    return SizedBox(height: screenHeight, width: screenWidth);
  }
}
