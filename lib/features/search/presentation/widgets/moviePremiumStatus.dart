import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class MoviePremiumStatus extends StatelessWidget {
  const MoviePremiumStatus({super.key,required this.index});
  final int index ;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 20,
      width: 65,
      decoration: BoxDecoration(
        color:choseStatus(index) ? AppColors.secondaryOrange:AppColors.primaryBlueAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child:choseStatus(index) ? Text('Premium',style: AppTextStyle.h7Medium500s10WhiteColor,):Text('Free',style: AppTextStyle.h7Medium500s10WhiteColor,)),
    );
  }
  bool choseStatus(int index){
    if(index%3==0&&index!=0){
      return true ;
    }
    else{
      return false ;
    }
  }
}
