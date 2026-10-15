import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/core/utils/api_utils.dart';
import 'package:ai_movie_app/features/search/presentation/controllers/search_by_actor/search_by_actor_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PresentActorResultWidget extends StatelessWidget {
  const PresentActorResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<SearchByActorCubit, SearchByActorState>(
      builder: (context, state) {
        switch (state) {
          case SearchByActorInitial():
            return searchByActorInitial();
          case SearchByActorLoading():
            return searchByActorLoading();
          case SearchByActorSuccess():
            return searchByActorSuccess(state, screenWidth);
          case SearchByActorError():
            return searchByActorError(state);
        }
      },
    );
  }

  Widget searchByActorInitial() {
    return Container(color: AppColors.mainColor);
  }

  Widget searchByActorLoading() {
    return Center(child: CircularProgressIndicator(color: Colors.white));
  }

  Widget searchByActorSuccess(SearchByActorSuccess state, double screenWidth) {
    var movie = state.searchByActorList;
    return movie.isEmpty?Center(child: Text('Not Found',style: AppTextStyle.H4Semibold600S16White,)) :  ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return ActorsResultWidget(
          fName:ApiUtils.formatTitleForMovieResult(movie[index].name) ,
          indexList: index,
          imageUrl: ApiUtils.getPosterImage(movie[index].profilePath??''),
        );
      },
      separatorBuilder: (context, index) =>
          SizedBox(width: screenWidth * 0.016),
      itemCount: movie.length,
    );
  }

  Widget searchByActorError(SearchByActorError state) {
    return Center(
      child: Text(
        state.errorMessage,
        style: AppTextStyle.H4Semibold600S16White,
      ),
    );
  }
}

class ActorsResultWidget extends StatelessWidget {
  const ActorsResultWidget({
    super.key,
    required this.indexList,
    required this.imageUrl,
    required this.fName,
  });

  final int indexList;

  final String imageUrl;

  final String fName;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CachedNetworkImage(
          height: screenHeight * 0.064,
          width: screenHeight * 0.064,
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(38),
                image: DecorationImage(fit: BoxFit.cover, image: imageProvider),
              ),
            );
          },
          errorWidget: (context, url, error) => ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadiusGeometry.circular(39),
            child: Image.asset(AppImages.profilePic),
          ),
          imageUrl: imageUrl,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator(color: Colors.white)),
        ),
        SizedBox(height: 8),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: fName,
                style: AppTextStyle.h6SemiBold600s12WhiteColor,
              ),
              TextSpan(
                text: 'Wilson',
                style: AppTextStyle.h6SemiBold600s12GrayColorColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
