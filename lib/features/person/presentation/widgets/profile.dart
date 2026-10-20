import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Container(
        height:screenHeight*0.11,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: BoxBorder.all(color: AppColors.PrimarySoft,width:0.5,)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(45),
                  child: Image.asset(AppImages.profilePic,height: 74,width: 74,fit: BoxFit.cover,)),
              SizedBox(width: 16,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tiffany',style: AppTextStyle.H4Semibold600S16White,),
                    Text('Tiffanyjearsey@gmail.com',style: AppTextStyle.h6SemiBold600s12GrayColorColor,overflow:TextOverflow.ellipsis ,),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              Image.asset(AppImages.iconEdit),


            ],
          ),
        ),
      ),
    );
  }
}
