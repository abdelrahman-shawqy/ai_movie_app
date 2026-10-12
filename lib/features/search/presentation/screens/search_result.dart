import 'package:ai_movie_app/features/search/presentation/screens/search_actor_result.dart';
import 'package:ai_movie_app/features/search/presentation/screens/search_movie_result.dart';
import 'package:ai_movie_app/features/search/presentation/widgets/switcher_search_result.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}
class _SearchResultState extends State<SearchResult> {
  SearchType resultType =SearchType.movies ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentGeometry.center,
            child: SwitcherSearchResultType(onChanged: (type) {
              setState(() {
                resultType = type ;
                print("########@@@@@@@@@@ resultType = $resultType ");
              });
            }),
          ),
          Expanded(child:resultType==SearchType.movies?SearchMovieResult() : SearchActorResult()),
        ],
      ),
    );
  }
}
