part of 'search_by_actor_cubit.dart';

@immutable
sealed class SearchByActorState extends Equatable{}

final class SearchByActorInitial extends SearchByActorState {
  @override
  List<Object?> get props => [];
}
final class SearchByActorLoading extends SearchByActorState {
  @override
  List<Object?> get props => [];
}
final class SearchByActorSuccess extends SearchByActorState {
  SearchByActorSuccess(this.searchByActorList);
  final List<PersonResultsModel>searchByActorList ;
  @override
  List<Object?> get props => [searchByActorList];
}
final class SearchByActorError extends SearchByActorState {
   SearchByActorError(this.errorMessage);
  final String errorMessage ;

  @override
  List<Object?> get props => [errorMessage];
}
