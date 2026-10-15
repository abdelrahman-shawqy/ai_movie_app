part of 'person_credits_cubit.dart';

@immutable
sealed class PersonCreditsState extends Equatable{}

final class PersonCreditsInitial extends PersonCreditsState {
  @override

  List<Object?> get props => [];
}
final class PersonCreditsLoading extends PersonCreditsState {
  @override

  List<Object?> get props => [];
}
final class PersonCreditsSuccess extends PersonCreditsState {
  PersonCreditsSuccess(this.cast);
  final List<CastModel>cast ;
  @override
  List<Object?> get props => [cast];
}
final class PersonCreditsError extends PersonCreditsState {
  PersonCreditsError(this.errorMessage);
  final String errorMessage ;

  @override
  List<Object?> get props => [errorMessage];
}
