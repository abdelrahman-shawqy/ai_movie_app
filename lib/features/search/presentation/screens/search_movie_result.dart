import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/routing/route.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/core/utils/api_utils.dart';
import 'package:ai_movie_app/features/search/presentation/controllers/search_by_movie/search_by_movie_cubit.dart';
import 'package:ai_movie_app/features/search/presentation/widgets/card_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchMovieResult extends StatelessWidget {
  SearchMovieResult({super.key, required this.searchWord});
  String searchWord;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchByMovieCubit, SearchByMovieState>(
      builder: (context, state) {
        switch (state) {
          case SearchByMovieInitial():
            return searchByMovieInitial();
          case SearchByMovieLoading():
            return searchByMovieLoading();
          case SearchByMovieSuccess():
            return searchByMovieSuccess(state);
          case SearchByMovieError():
           return searchByMovieError(state);
        }
      },
    );

  }
  Widget searchByMovieInitial(){
    print(
      '####### SearchMovieResult SearchByMovieInitial searchWord1 =${searchWord}',
    );
    return Container(color: AppColors.mainColor);
  }
  Widget searchByMovieLoading(){
    return Center(
      child: CircularProgressIndicator(color: Colors.white),
    );
  }
  Widget searchByMovieSuccess(SearchByMovieSuccess state){
    return state.resultSearchByMovieModel.isEmpty?Image.asset(AppImages.searchCanNotBeFound):ListView.separated(
      itemBuilder: (context, index){
        final movie = state.resultSearchByMovieModel[index];
        return CardCustomWidget(
          title:ApiUtils.formatTitleForMovieResult(movie.title) ,
          voteAverage:ApiUtils.formatVoteAverageForMovieResult(movie.voteAverage),
          posterPath: ApiUtils.getPosterImage(movie.posterPath??''),
          genreIds:ApiUtils.getGenreName(movie.genreIds),
          indexList: index,
          releaseDate:ApiUtils.formatReleaseDateWithYearForMovieResult(movie.releaseDate),
          overview: ApiUtils.formatTitleForMovieResult(movie.overview),
          movieId: movie.id,
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 16),
      itemCount: state.resultSearchByMovieModel.length,
    );
  }
  Widget searchByMovieError(SearchByMovieError state){
    return Center(
      child: Text(
        state.errorMessage,
        style: AppTextStyle.H4Semibold600S16White,
      ),
    );
  }

}
