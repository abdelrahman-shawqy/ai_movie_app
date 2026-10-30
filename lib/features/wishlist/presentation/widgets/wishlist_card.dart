import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.PrimarySoft,
          borderRadius: BorderRadius.circular(16)
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Container(height: 130,width: 150,child: Image.asset('assets/images/premium_banner.png',fit: BoxFit.fill,),),
                Image.asset(AppImages.playMovie),
              ],
            ),
            SizedBox(width: 16,),
            Column(children: [
              Text("action"),
              Text("Spider-Man No Way Home"),
              Row(
                children: [
                  Text('movie'),
                  Image.asset(AppImages.starRate),
                  Text('4.5'),
                ],
              )
            ],),

          ],
        ),
      ),
    );
  }
}
