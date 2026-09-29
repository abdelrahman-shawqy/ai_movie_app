import 'package:flutter/material.dart';

class IconSignupWith extends StatelessWidget {
  const IconSignupWith({super.key,required this.image,required this.color});
final String image ;
final Color color ;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width ;
    return  CircleAvatar(
      backgroundColor:color,
      radius: screenWidth*0.085,
      child: Image.asset(image),
    );
  }
}
