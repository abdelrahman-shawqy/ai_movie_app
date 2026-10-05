import 'dart:ui';
import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/core/utils/api_utils.dart';
import 'package:ai_movie_app/features/home/presentation/controller/most_popular_movies/most_popular_movies_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmView extends StatelessWidget {
  const FilmView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight * 0.280,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        //shrinkWrap: true,
        itemBuilder: (context, index) => Card(listViewIndex: index),
        separatorBuilder: (context, index) => sizedBoxFun(screenWidth: 12),
        itemCount: 10,
      ),
    );
  }

  sizedBoxFun({double? screenHeight, double? screenWidth}) {
    return SizedBox(height: screenHeight, width: screenWidth);
  }
}

class Card extends StatelessWidget {
  const Card({super.key, required this.listViewIndex});

  final int listViewIndex;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<MostPopularMoviesCubit, MostPopularMoviesState>(
      builder: (context, state) {
        switch (state) {
          case MostPopularMoviesLoading():
            return Center(child: CircularProgressIndicator());
          case MostPopularMoviesSuccess():
            return Container(
              width: 155,
              decoration: BoxDecoration(
                color: AppColors.PrimarySoft,
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: AlignmentGeometry.topRight,
                    children: [
                      CachedNetworkImage(
                        height: screenHeight*0.210,
                        width: screenWidth * 0.350,
                        imageBuilder: (context, imageProvider)=>Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                              borderRadius: BorderRadiusGeometry.only(topRight: Radius.circular(12),topLeft: Radius.circular(12))),
                        ),
                        errorWidget: (context, url, error) => Text('${error}'),
                        imageUrl: ApiUtils.getPosterImage(state.resultsMostPopularMoviesModel[listViewIndex].posterPath,),
                        placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Colors.white,)),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 8, top: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(8),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Container(
                              height: 24,
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(
                                  0xff25283652,
                                ).withValues(alpha: 0.32),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(AppImages.starRate),
                                    SizedBox(width: 5),
                                    Text(
                                      '${state.resultsMostPopularMoviesModel[listViewIndex].voteAverage.toStringAsFixed(1)}',
                                      style: TextStyle(
                                        color: Color(0xffFF8700),
                                      ),
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
                  SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      '${state.resultsMostPopularMoviesModel[listViewIndex].title}',
                      style: AppTextStyle.H4Semibold600S16White,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      //
                      '${ApiUtils.getGenreName(state.resultsMostPopularMoviesModel[listViewIndex].genreIds[0])}',
                      style: AppTextStyle.h7Medium500s10GrayColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          case MostPopularMoviesError():
            return Center(child: Text(state.errorMessage,style: AppTextStyle.h5Medium500S14));
        }
      },
    );
  }
}
