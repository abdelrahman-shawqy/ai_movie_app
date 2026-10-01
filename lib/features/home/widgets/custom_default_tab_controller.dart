import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomDefaultTabController extends StatelessWidget {
   CustomDefaultTabController({super.key});
  final List<String> categoriesTaps = [
    'all',
    'comedy',
    'animation',
    'all',
    'comedy',
    'animation',
  ];

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: categoriesTaps.length,
      animationDuration: Duration(milliseconds: 150),

      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        indicatorColor: Colors.transparent,
        indicator: BoxDecoration(
          color: AppColors.PrimarySoft,
          borderRadius: BorderRadius.circular(8),
        ),

        dividerColor: Colors.transparent,

        labelStyle: AppTextStyle.H6Medium500S12primaryBlueAccent,
        unselectedLabelStyle: AppTextStyle.H6Medium500S12,

        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        onTap: (index){},

        tabs: categoriesTaps.map((e) => Container(
            height: 30,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Tab(child: Text(e)),
          ),).toList(),

      ),
    );
  }
}
