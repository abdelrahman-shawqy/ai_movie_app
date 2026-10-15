import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class SearchTextFieldSearch extends StatefulWidget {
   const SearchTextFieldSearch({super.key,required this.isSearchActiveFun,required this.onSearchTextChanged});
   final Function isSearchActiveFun ;
   final ValueChanged<String> onSearchTextChanged ;
  @override
  State<SearchTextFieldSearch> createState() => _SearchTextFieldSearchState();
}
class _SearchTextFieldSearchState extends State<SearchTextFieldSearch> {
  bool isSearchActive =false ;
  late  TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }
  @override
  void dispose() {
    controller.dispose();
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
              onChanged: widget.onSearchTextChanged,
              onTap: (){
                setState(() {
                  if(isSearchActive==true)return ;
                  widget.isSearchActiveFun(isSearchActive = true) ;
                  print('########## TextField onTap  isSearchActive = $isSearchActive');
                });
              },
              controller: controller,
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
            visible:isSearchActive ,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    widget.isSearchActiveFun(isSearchActive = false) ;
                    print('########## isSearchActive Cancel TextField= $isSearchActive');
                    FocusScope.of(context).unfocus();
                    controller.clear();
                    widget.onSearchTextChanged('');
                  });
                },
                  child: Container(
                      height:screenHeight*0.045,
                      width:screenWidth*0.12,
    child: Center(child: Text('Cancel',style: AppTextStyle.H6Medium500S12,))))),
        ],
      ),
    );
  }


}
