import 'dart:async';

import 'package:ai_movie_app/features/search/data/models/search_by_actor_model.dart';
import 'package:ai_movie_app/features/search/domain/use_case/search_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'search_by_actor_state.dart';

class SearchByActorCubit extends Cubit<SearchByActorState> {
  SearchByActorCubit(this.searchUseCase) : super(SearchByActorInitial());
  final SearchUseCase searchUseCase ;

  Timer? _debounce ;
  void onSearchQueryChanged(String query) {
    if(_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce=Timer(Duration(milliseconds: 200),(){
      getSearchByActorData(query);
    });
  }

  Future<void>getSearchByActorData(String searchWord)async{
    if(searchWord.isEmpty||searchWord.trim().isEmpty){
      print('###################### getResultSearchByMovieModel f2');

    }else{
      emit(SearchByActorLoading());
      if (isClosed) return;
      var searchByActorData=await searchUseCase.callSearchByActorResponse(searchWord);
      if (isClosed) return;

      searchByActorData.fold((error){
        emit(SearchByActorError(error.errorMessage));
      }, (success){
        emit(SearchByActorSuccess(success.results));
      });
    }

  }

}
