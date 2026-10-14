import 'package:ai_movie_app/core/dependency%20_injection/di.dart';
import 'package:ai_movie_app/features/search/presentation/controllers/search_by_movie/search_by_movie_cubit.dart';
import 'package:ai_movie_app/features/search/presentation/screens/search_actor_result.dart';
import 'package:ai_movie_app/features/search/presentation/screens/search_movie_result.dart';
import 'package:ai_movie_app/features/search/presentation/widgets/switcher_search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResult extends StatefulWidget {
   SearchResult({super.key,required this.searchWord});
   String searchWord ;
  @override
  State<SearchResult> createState() => _SearchResultState();
}
class _SearchResultState extends State<SearchResult> {
  SearchType resultType =SearchType.movies ;
  late SearchByMovieCubit searchByMovieCubit ;
  @override
  void initState() {
    super.initState();
    searchByMovieCubit=getIt<SearchByMovieCubit>();
    searchByMovieCubit.onSearchQueryChanged(widget.searchWord);
  }
  @override
  void didUpdateWidget(covariant SearchResult oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.searchWord!=widget.searchWord){
      searchByMovieCubit.onSearchQueryChanged(widget.searchWord);

    }

  }

  @override
  void dispose() {
    searchByMovieCubit.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print('######## SearchResult the screen is rebild depend on searchWord');
    return BlocProvider.value(value: searchByMovieCubit,child: Container(
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
            Expanded(child:resultType==SearchType.movies?SearchMovieResult(searchWord: widget.searchWord,) : SearchActorResult(searchWord: widget.searchWord,)),
          ],
        )),);
  }
}
