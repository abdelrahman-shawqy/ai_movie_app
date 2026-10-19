import 'package:ai_movie_app/core/dependency%20_injection/di.dart';
import 'package:ai_movie_app/core/routing/route.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/utils/api_utils.dart';
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDefaultTabControllerForSearchScreen(),
            sizedBoxFun(screenHeight: screenHeight * 0.024),
            Text('Today', style: AppTextStyle.H4Semibold600S16White),

            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.016,
                bottom: screenHeight * 0.085,
                right: screenWidth * 0.024,
              ),
              child: BlocBuilder<TrendingMoviesCubit, TrendingMoviesState>(
                builder: (BuildContext context, state) {
                  switch (state) {
                    case TrendingMoviesLoading():
                      return trendingMoviesLoading();
                    case TrendingMoviesSuccess():
                      return trendingMoviesSuccess(state, context);
                    case TrendingMoviesError():
                      return trendingMoviesError(state);
                  }
                },
              ),
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
                  Text('See All', style: AppTextStyle.H4Semibold500S14),
                ],
              ),
            ),
            FilmView(),
          ],
        ),
      ),
    );
  }

  Widget trendingMoviesLoading() {
    return Center(child: CircularProgressIndicator(color: Colors.white));
  }

  Widget trendingMoviesSuccess(
    TrendingMoviesSuccess state,
    BuildContext context,
  ) {
    final movie = state.trendingMovieResultModel[3];
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.movieDetailsScreen,
          arguments: {
            'title': ApiUtils.formatTitleForMovieResult(movie.title),
            'voteAverage': ApiUtils.formatVoteAverageForMovieResult(
              movie.voteAverage,
            ),
            'releaseDate': ApiUtils.formatReleaseDateWithYearForMovieResult(
              movie.releaseDate,
            ),
            'posterPath': ApiUtils.getPosterImage(movie.posterPath),
            'overview': ApiUtils.formatTitleForMovieResult(movie.overview),
          },
        );
      },
      child: CardCustomWidget(
        indexList: 3,
        overview: ApiUtils.formatTitleForMovieResult(movie.overview),
        posterPath: ApiUtils.getBackDropImage(movie.posterPath),
        voteAverage: movie.voteAverage.toStringAsFixed(1),
        title: movie.title,
        movieId: movie.id,
        genreIds: ApiUtils.getGenreName(movie.genreIds),
        releaseDate: (state.trendingMovieResultModel[3].releaseDate).substring(
          0,
          4,
        ),
      ),
    );
  }

  Widget trendingMoviesError(TrendingMoviesError state) {
    return Center(
      child: Text(state.errorMessage, style: AppTextStyle.h5Medium500S14),
    );
  }

  sizedBoxFun({double? screenHeight, double? screenWidth}) {
    return SizedBox(height: screenHeight, width: screenWidth);
  }
}
