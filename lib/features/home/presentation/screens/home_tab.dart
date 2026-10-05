import 'package:ai_movie_app/core/dependency%20_injection/di.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/home/presentation/controller/most_popular_movies/most_popular_movies_cubit.dart';
import 'package:ai_movie_app/features/home/presentation/controller/movie_list/movie_list_cubit.dart';
import 'package:ai_movie_app/features/home/presentation/controller/trending_movies/trending_movies_cubit.dart';
import 'package:ai_movie_app/features/home/presentation/widgets/custom_default_tab_controller.dart';
import 'package:ai_movie_app/features/home/presentation/widgets/film_view.dart';
import 'package:ai_movie_app/features/home/presentation/widgets/search_text_field.dart';
import 'package:ai_movie_app/features/home/presentation/widgets/trending_home_widget_view.dart';
import 'package:ai_movie_app/features/home/presentation/widgets/user_welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: MultiBlocProvider(
  providers: [
    BlocProvider(
  create: (context) =>getIt<MovieListCubit>()..getMovieList(),
),
    BlocProvider(
      create: (context) =>getIt<MostPopularMoviesCubit>()..getMostPopularMovies(1),
    ),
    BlocProvider(create: (context)=>getIt<TrendingMoviesCubit>()..getTrendingMovies()),
  ],
  child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              UserWelcome(),
              SearchTextField(),
              TrendingHomeWidgetView(),
              sizedBoxFun(screenHeight: 24),

              Align(
                alignment: AlignmentGeometry.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Categories',
                        style: AppTextStyle.H4Semibold600S16White,
                      ),
                      sizedBoxFun(screenHeight: screenHeight * 0.010),
                      CustomDefaultTabController(),
                      sizedBoxFun(screenHeight: screenHeight * 0.024),
                      Padding(
                        padding: EdgeInsets.only(
                          right: screenHeight * 0.024,
                          bottom: screenHeight * 0.016,
                        ),
                        child: Row(
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
                      ),
                      FilmView(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
),
    );
  }

  sizedBoxFun({double? screenHeight, double? screenWidth}) {
    return SizedBox(height: screenHeight, width: screenWidth);
  }
}
