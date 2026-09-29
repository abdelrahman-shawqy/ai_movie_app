  import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
    const MainButton({super.key,required this.label,required this.navigate});
    final String label ;
    final Function navigate  ;
    @override
    Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width ;
      final screenHeight = MediaQuery.of(context).size.height ;

      return Padding(
        padding: EdgeInsets.symmetric(horizontal:screenWidth*0.050),
        child: InkWell(
          onTap: (){
            navigate();
          },
          child: Container(
            width: screenWidth,
            height: screenHeight*0.065,
            decoration: BoxDecoration(
              color: AppColors.primaryBlueAccent,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Center(child: Text(label,style: AppTextStyle.medium500S20,)),
          ),
        ),
      );
    }
  }
