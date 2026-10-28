import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFieldChat extends StatelessWidget {
  CustomTextFieldChat({super.key,required this.controller,required this.send});
  final TextEditingController controller ;
  final VoidCallback send ;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height ;
    final screenWidth = MediaQuery.of(context).size.width ;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.020),
      child: Container(
        padding: EdgeInsetsGeometry.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: BoxBorder.all(
            width: 2,
            color: AppColors.grayColor
          )
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: screenHeight*0.055,
              child: TextFormField(
                cursorColor: AppColors.whiteGrey,
                controller:controller ,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hint: Align(
                    alignment: Alignment.centerLeft,
                      child: Text('You can ask a question.',style:AppTextStyle.h5Medium500S14,)),

                  contentPadding: EdgeInsets.only(top:screenHeight*0.050,left:screenWidth*0.035),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: InputBorder.none,

                ),
              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: send,
              child: Container(
               height: 70,
               width: 70,
               decoration: BoxDecoration(
                 color: AppColors.primaryBlueAccent,
                 borderRadius: BorderRadius.circular(18),
               ),
                child: Icon(Icons.arrow_circle_up,color: Colors.white,size: 35,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
