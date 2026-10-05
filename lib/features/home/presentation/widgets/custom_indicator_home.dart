import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key , required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Dot(
          active: index==0? true:false,
        ),
        SizedBox(
          width: 12,
        ),
        Dot(
          active:index==1?true: false,
        ),
        SizedBox(
          width: 12,
        ),
        Dot(
          active:index==2?true: false,
        ),
      ],
    );
  }
}
class Dot extends StatelessWidget {
  const Dot({super.key,required this.active});
  final bool active ;
  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(
      duration:Duration(milliseconds: 250) ,
      width: active?32:10,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color:active ? AppColors.primaryBlueAccent: AppColors.dotColor,
      ),
    );
  }
}
