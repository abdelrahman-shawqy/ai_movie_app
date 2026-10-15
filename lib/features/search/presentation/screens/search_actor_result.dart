import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/dependency%20_injection/di.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/utils/api_utils.dart';
import 'package:ai_movie_app/features/search/presentation/controllers/person_credits/person_credits_cubit.dart';
import 'package:ai_movie_app/features/search/presentation/widgets/actors_result_widget.dart';
import 'package:ai_movie_app/features/search/presentation/widgets/card_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchActorResult extends StatelessWidget {
  SearchActorResult({super.key, required this.searchWord});

  String searchWord;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => getIt<PersonCreditsCubit>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.010),
          Text('Actors', style: AppTextStyle.H4Semibold600S16White),
          SizedBox(height: screenHeight * 0.016),
          SizedBox(
            height: screenHeight * 0.095,
            child: PresentActorResultWidget(),
          ),
          SizedBox(height: screenHeight * 0.024),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Most popular', style: AppTextStyle.H4Semibold600S16White),
              Text('See All', style: AppTextStyle.H4Semibold500S14),
            ],
          ),
          BlocBuilder<PersonCreditsCubit, PersonCreditsState>(
            builder: (context, state) {
              switch (state) {
                case PersonCreditsInitial():
                  return SizedBox();
                case PersonCreditsLoading():
                  return personCreditsLoading();
                case PersonCreditsSuccess():
                  /// TODO if there is no data result return Image.asset(AppImages.searchCanNotBeFound) you must handel
                  return personCreditsSuccess(state) ;
                case PersonCreditsError():
                  return personCreditsError(state);
              }
            },
          ),
        ],
      ),
    );
  }
  Widget personCreditsLoading(){
    return Center(child: CircularProgressIndicator(color: Colors.white));
  }
  Widget personCreditsSuccess(PersonCreditsSuccess state){
    var castList = state.cast ;
    return castList.isEmpty?Image.asset(AppImages.searchCanNotBeFound): Expanded(
      child: ListView.separated(
        itemBuilder:(context,index)=> CardCustomWidget(
          indexList: index,
          title:ApiUtils.formatTitleForMovieResult(castList[index].title??''),
          backdropPath: ApiUtils.getPosterImage(castList[index].backdropPath??""),
          releaseDate: ApiUtils.formatReleaseDateWithYearForMovieResult(castList[index].releaseDate??''),
          genreIds: ApiUtils.getGenreName(castList[index].genreIds),
          voteAverage:ApiUtils.formatVoteAverageForMovieResult(castList[index].voteAverage) ,
        ),
        separatorBuilder:(context,index)=> SizedBox(height: 16,),
        itemCount: castList.length,
      ),
    );
  }
  Widget personCreditsError(PersonCreditsError state){
    return Center(
      child: Text(
        state.errorMessage,
        style: AppTextStyle.H4Semibold600S16White,
      ),
    );
  }
}
