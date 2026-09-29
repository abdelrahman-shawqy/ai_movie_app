import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isSelected =false ;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
        value: isSelected,
        onChanged: (_){
          isSelected = ! isSelected ;
          setState(() {

          });
        });
  }
}
