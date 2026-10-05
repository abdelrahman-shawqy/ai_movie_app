import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/utils/api_utils.dart';
import 'package:ai_movie_app/features/home/presentation/controller/trending_movies/trending_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_indicator_home.dart';

class TrendingHomeWidgetView extends StatefulWidget {
  const TrendingHomeWidgetView({super.key});

  @override
  State<TrendingHomeWidgetView> createState() => _TrendingHomeWidgetViewState();
}

class _TrendingHomeWidgetViewState extends State<TrendingHomeWidgetView> {
  final controller = PageController();
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight*0.23,
      width: screenWidth*0.940,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height:screenHeight*0.200,
            width: screenHeight*0.950,
            child: PageView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              children: [Card(pageViewIndex: index,), Card(pageViewIndex: index,), Card(pageViewIndex: index,)],
            ),
          ),
          sizedBoxFun(screenHeight: 10),
          Container(width:screenWidth*0.170, child: CustomIndicator(index: index)),
        ],
      ),
    );
  }

  sizedBoxFun({double? screenHeight, double? screenWidth}) {
    return SizedBox(height: screenHeight, width: screenWidth);
  }
}

class Card extends StatelessWidget {
  const Card({super.key,required this.pageViewIndex});
  final int pageViewIndex ;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<TrendingMoviesCubit,TrendingMoviesState>(
      builder: (context,state) {
        switch (state){
          case TrendingMoviesLoading():
           return Center(child: CircularProgressIndicator(color: Colors.white,),);
          case TrendingMoviesSuccess():
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Stack(
                alignment: AlignmentGeometry.bottomLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(16),
                    child: Image.network(
                      width:double.infinity ,
                      height:double.infinity ,
                      ApiUtils.getBackDropImage(state.trendingMovieResultModel[pageViewIndex].backdropPath),fit: BoxFit.fill,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start  ,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 250,
                          child: Text(state.trendingMovieResultModel[pageViewIndex].title,style: AppTextStyle.H4Semibold600S16White,overflow:TextOverflow.ellipsis,maxLines: 2,),
                        ),
                        SizedBox(height: 4,),
                        Text('On ${state.trendingMovieResultModel[pageViewIndex].releaseDate}',style: AppTextStyle.H6Medium500S12,)
                      ],
                    ),
                  ),
                ],
              ),
            );
          case TrendingMoviesError():
           return Center(child: Text(state.errorMessage),);
        }

      },
    );

  }

}
