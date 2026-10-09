import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.labelText,
    required this.validator,
    required this.passWordController,
  });

  final String labelText;

  final String? Function(String?) validator;

  final TextEditingController passWordController;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.020),
      child: SizedBox(
        height: screenHeight * 0.065,
        child: TextFormField(
          validator: widget.validator,
          cursorColor: AppColors.whiteGrey,
          controller: widget.passWordController,
          obscureText: obscureText,
          style: AppTextStyle.h5Medium500S14,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              top: screenHeight * 0.050,
              left: screenWidth * 0.035,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                obscureText = !obscureText;
                setState(() {});
              },
              child: Icon(Icons.visibility_off_outlined),
            ),
            labelText: widget.labelText,
            labelStyle: AppTextStyle.H6Medium500S12,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Colors.white38, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Colors.white38, width: 1),
            ),
          ),
        ),
      ),
    );
  }
}
