import 'dart:ui';

import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class FilmView extends StatelessWidget {
  const FilmView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight*0.280,
      width: double.infinity,
      child: ListView.separated(
        //controller: ScrollController(),
        scrollDirection: Axis.horizontal,
        //shrinkWrap: true,
        itemBuilder: (context, index) => Card(),
        separatorBuilder: (context, index) => sizedBoxFun(screenWidth: 12),
        itemCount: 10,
      ),
    );
  }

  sizedBoxFun({double? screenHeight, double? screenWidth}) {
    return SizedBox(height: screenHeight, width: screenWidth);
  }
}

class Card extends StatelessWidget {
  const Card({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: 155,
      decoration: BoxDecoration(
        color: AppColors.PrimarySoft,
        borderRadius: BorderRadiusGeometry.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: AlignmentGeometry.topRight,
            children: [
              Container(
                width: screenWidth*0.350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child:Image.asset('assets/images/card_image.png',fit: BoxFit.fill,) ,
              ),

              Padding(
                padding: const EdgeInsets.only(right: 8,top: 4),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(8),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20,sigmaY: 20,),
                    child: Container(
                      height: 24,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xff25283652).withValues(alpha:0.32),
                      ),
                      child:Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('assets/images/star_rate.png'),
                            SizedBox(
                              width: 5,
                            ),
                            Text('4.5',style: TextStyle(color: Color(0xffFF8700)),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: Text('The Jungle Wa..',style: AppTextStyle.H4Semibold600S16White,overflow: TextOverflow.ellipsis,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text('Action',style: AppTextStyle.h7Medium500s10GrayColor,overflow: TextOverflow.ellipsis),
          ),

        ],
      ),
    );
  }
}
