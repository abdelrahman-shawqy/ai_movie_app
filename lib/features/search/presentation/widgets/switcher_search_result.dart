import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
enum SearchType { movies, actors }
class SwitcherSearchResultType extends StatefulWidget {
  const SwitcherSearchResultType({super.key,required this.onChanged });
  final ValueChanged<SearchType> onChanged ;

  @override
  State<SwitcherSearchResultType> createState() =>
      _SwitcherSearchResultTypeState();
}

class _SwitcherSearchResultTypeState extends State<SwitcherSearchResultType> {
  SearchType searchSelected = SearchType.movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  searchSelected = SearchType.movies;
                  widget.onChanged(SearchType.movies);
                });
              },
              child: CustomIndicator(
                isSelected: searchSelected == SearchType.movies,
                text: 'Movies',
              ),
            ),
            SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                setState(() {
                  searchSelected = SearchType.actors;
                  widget.onChanged(SearchType.actors);

                });
              },
              child: CustomIndicator(
                isSelected:
                    searchSelected == SearchType.actors,
                text: 'Actors',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomIndicator extends StatelessWidget {
  CustomIndicator({super.key, required this.isSelected, required this.text});
  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 40,
      width: isSelected ? 80 : 70,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.PrimarySoft : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: BoxBorder.all(
          color: isSelected
              ? Colors.transparent
              : AppColors.primaryBlueAccent.withAlpha(40),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: isSelected
              ? AppTextStyle.H6Medium500S12primaryBlueAccent
              : AppTextStyle.H6Medium500S12,
        ),
      ),
    );
  }
}
