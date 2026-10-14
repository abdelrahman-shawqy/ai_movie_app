
import 'dart:async';

import 'package:ai_movie_app/features/search/data/models/search_by_movie_model.dart';
import 'package:ai_movie_app/features/search/domain/use_case/search_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'search_by_movie_state.dart';

class SearchByMovieCubit extends Cubit<SearchByMovieState> {
  SearchByMovieCubit(this.searchUseCase) : super(SearchByMovieInitial());
  final SearchUseCase searchUseCase ;

  Timer? _debounce ;
  void onSearchQueryChanged(String query) {
    if(_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce=Timer(Duration(milliseconds: 200),(){
      getResultSearchByMovie(query);
    });
  }

  Future<void>getResultSearchByMovie(String searchWord )async{
    print('###################### getResultSearchByMovieModel f1');
     if(searchWord.isEmpty||searchWord.trim().isEmpty){
       print('###################### getResultSearchByMovieModel f2');
       if (isClosed) return;
       emit(SearchByMovieInitial());
     }
    else{
       print('###################### getResultSearchByMovieModel f3');
       if (isClosed) return;
       emit(SearchByMovieLoading());
    print('###################### getResultSearchByMovieModel f4');
    var resultSearchByMovieModel =await searchUseCase.callSearchByMovieResponse(searchWord);
    resultSearchByMovieModel.fold((error){
      if (isClosed) return;
    emit(SearchByMovieError(error.errorMessage));
    print('###################### getResultSearchByMovieModel f5');

    }, (success){
      if (isClosed) return;
    emit(SearchByMovieSuccess(success.results));
    print('###################### getResultSearchByMovieModel f6');

    });
    }
  }

}
