import 'package:ai_movie_app/features/search/data/models/person_credits_model.dart';
import 'package:ai_movie_app/features/search/domain/use_case/search_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'person_credits_state.dart';

class PersonCreditsCubit extends Cubit<PersonCreditsState> {
  PersonCreditsCubit(this.searchUseCase) : super(PersonCreditsInitial());
final SearchUseCase searchUseCase ;
  Future<void>getPersonCredits(String personId)async {
    if(isClosed)return;
    emit(PersonCreditsLoading());
    var personCredits =await  searchUseCase.callPersonCreditsResponse(personId);
    if(isClosed)return;
    personCredits.fold((error){
      emit(PersonCreditsError(error.errorMessage));
    }, (success){
      emit(PersonCreditsSuccess(success.cast));
    });
  }

}
