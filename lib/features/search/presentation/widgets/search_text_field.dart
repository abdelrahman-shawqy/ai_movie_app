import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class SearchTextFieldSearch extends StatefulWidget {
   const SearchTextFieldSearch({super.key,required this.controller,required this.isTypingFun});
  final  TextEditingController controller;
   final Function isTypingFun ;
  @override
  State<SearchTextFieldSearch> createState() => _SearchTextFieldSearchState();
}
class _SearchTextFieldSearchState extends State<SearchTextFieldSearch> {
  bool isTyping =false ;
  @override
  void dispose() {
    isTyping =false ;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.040,
        right: screenWidth * 0.040,
        top: screenWidth * 0.040,
        bottom: screenHeight * 0.024,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onTap: (){
                setState(() {
                  widget.isTypingFun(isTyping = true) ;
                  print('########## $isTyping');

                });
              },
              controller: widget.controller,
              cursorColor: Colors.white,
              style: AppTextStyle.h5Medium500S14,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.PrimarySoft,
                prefixIcon: Image.asset(AppImages.searchIcon),
                hint: Text(
                  'Type title, categories, years, etc',
                  style: AppTextStyle.h5Medium500S14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
          ),
          SizedBox(width: 9,),
          Visibility(
            visible:isTyping ,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    widget.isTypingFun(isTyping = false) ;
                    print('########## $isTyping');
                    FocusScope.of(context).unfocus();
                  });
                },
                  child: Container(
                      height:screenHeight*0.045,
                      width:screenWidth*0.14,
    child: Center(child: Text('Cancel',style: AppTextStyle.H6Medium500S12,))))),
        ],
      ),
    );
  }


}
