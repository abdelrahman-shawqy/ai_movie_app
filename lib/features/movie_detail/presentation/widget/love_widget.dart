import 'package:flutter/material.dart';

class LoveWidget extends StatelessWidget {
  const LoveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return  Container(
      width:screenHeight*0.040,
      height: screenHeight*0.040,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child:  Icon(
        Icons.favorite,
        color: Color(0xFFFF2D2D),
        size: screenHeight*0.024,
      ),
    );
  }
}
