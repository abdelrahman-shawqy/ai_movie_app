import 'package:ai_movie_app/core/dependency%20_injection/di.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/features/home/presentation/controller/most_popular_movies/most_popular_movies_cubit.dart';
import 'package:ai_movie_app/features/home/presentation/controller/movie_list/movie_list_cubit.dart';
import 'package:ai_movie_app/features/home/presentation/controller/trending_movies/trending_movies_cubit.dart';
import 'package:ai_movie_app/features/home/presentation/widgets/film_view.dart';
import 'package:ai_movie_app/features/search/presentation/widgets/card_custom_widget.dart';
import 'package:ai_movie_app/features/search/presentation/widgets/custom_default_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DefaultSearchTap extends StatelessWidget {
  const DefaultSearchTap({super.key});

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
    return
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<MovieListCubit>()..getMovieList(),
          ),
          BlocProvider(
            create: (context) =>
            getIt<MostPopularMoviesCubit>()..getMostPopularMovies(1),
          ),
          BlocProvider(
            create: (context) =>
            getIt<TrendingMoviesCubit>()..getTrendingMovies(),
          ),
        ],
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDefaultTabControllerForSearchScreen(),
          sizedBoxFun(screenHeight: 24),
          Text('Today', style: AppTextStyle.H4Semibold600S16White,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 16,bottom: 95,right: 24 ),
            child: CardCustomWidget(indexList: 3,),
          ),

          Padding(
            padding: EdgeInsets.only(
              right: screenHeight * 0.024,
              bottom: screenHeight * 0.016,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recommend For You',
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
      );
  }
  sizedBoxFun({double? screenHeight, double? screenWidth}) {
    return SizedBox(height: screenHeight, width: screenWidth);
  }
}
