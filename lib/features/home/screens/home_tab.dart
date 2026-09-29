import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height ;
    final screenWidth = MediaQuery.of(context).size.width ;
    return  Scaffold(
      backgroundColor: AppColors.mainColor,
      body:Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(top:screenHeight*0.052,left: screenWidth*0.034,right: screenWidth*0.024,bottom: screenHeight*0.032 ),
              child: Container(
                color: Colors.red,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: screenWidth*0.06,
                      backgroundColor: Colors.white,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 16,),
                      child: Text.rich(
                          TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Hello, Smith\n',
                                    style: AppTextStyle.H4Semibold600S16White
                                ),
                                TextSpan(
                                    text: 'Let’s stream your favorite movie',
                                    style: AppTextStyle.H6Medium500S12
                                )
                              ]
                          )
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ) ,
    );
  }
  sizedBoxFun({double? screenHeight,double?screenWidth}){
    return  SizedBox(
      height: screenHeight,
      width: screenWidth,
    );
  }
}
