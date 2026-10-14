import 'package:ai_movie_app/core/dependency%20_injection/di.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/home/presentation/controller/most_popular_movies/most_popular_movies_cubit.dart';
import 'package:ai_movie_app/features/home/presentation/controller/movie_list/movie_list_cubit.dart';
import 'package:ai_movie_app/features/home/presentation/controller/trending_movies/trending_movies_cubit.dart';
import 'package:ai_movie_app/features/search/presentation/screens/search_result.dart';
import 'package:ai_movie_app/features/search/presentation/screens/default_search_tap.dart';
import 'package:ai_movie_app/features/search/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> with SingleTickerProviderStateMixin {
  late AnimationController animationController ;
  late Animation<Offset> positionController ;
   bool isSearchActive = false ;
   String searchWord ='';
  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 15));
    positionController = Tween<Offset>(begin: Offset(0, 0.04),end:Offset.zero).animate(animationController);
    super.initState();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Padding(
        padding:  EdgeInsets.only(left:screenWidth*0.054,right: screenWidth*0.054,bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxFun(screenHeight: screenHeight * 0.060),
            SearchTextFieldSearch(
              onSearchTextChanged:onSearchTextChanged ,
              isSearchActiveFun: updateTyping,
            ),
            Expanded(
              child: AnimatedSwitcher(
                    duration: Duration(seconds: 1),
                    child: isSearchActive?SearchResult(searchWord:searchWord,):DefaultSearchTap()),
            ),
          ],
        ),
      ),
    );
  }

  sizedBoxFun({double? screenHeight, double? screenWidth}) {
    return SizedBox(height: screenHeight, width: screenWidth);
  }
  void updateTyping(bool typing) {
    setState(() {
      isSearchActive = typing;
    });
  }
  void  onSearchTextChanged(String text){
   setState(() {
     searchWord = text ;
     print('########### from onSearchTextChanged SearchTab = $searchWord');
   });
  }


}
