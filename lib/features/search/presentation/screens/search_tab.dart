import 'package:ai_movie_app/core/dependency%20_injection/di.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/home/presentation/controller/most_popular_movies/most_popular_movies_cubit.dart';
import 'package:ai_movie_app/features/home/presentation/controller/movie_list/movie_list_cubit.dart';
import 'package:ai_movie_app/features/home/presentation/widgets/custom_default_tab_controller.dart';
import 'package:ai_movie_app/features/search/presentation/widgets/custom_default_tab_controller.dart';
import 'package:ai_movie_app/features/search/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<MovieListCubit>()..getMovieList(),
          ),
          BlocProvider(
            create: (context) =>
            getIt<MostPopularMoviesCubit>()..getMostPopularMovies(1),
          ),
        ],
        child: Container(
          color: Colors.green,
          child: SingleChildScrollView(
            child: Column(
              children: [
                sizedBoxFun(screenHeight: screenHeight * 0.050),
                SearchTextFieldSearch(),
                CustomDefaultTabControllerSearch(),

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
