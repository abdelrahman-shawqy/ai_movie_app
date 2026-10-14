part of 'search_by_movie_cubit.dart';

@immutable
sealed class SearchByMovieState extends Equatable{}

final class SearchByMovieInitial extends SearchByMovieState {
  @override
  List<Object?> get props => [];

}
final class SearchByMovieLoading extends SearchByMovieState {
  @override
  List<Object?> get props => [];
}
final class SearchByMovieSuccess extends SearchByMovieState {
  SearchByMovieSuccess(this.resultSearchByMovieModel);
  final List<ResultSearchByMovieModel>resultSearchByMovieModel ;
  @override
  List<Object?> get props => [resultSearchByMovieModel];
}
final class SearchByMovieError extends SearchByMovieState {
  SearchByMovieError(this.errorMessage);
  final String errorMessage ;

  @override
  List<Object?> get props => [errorMessage];

}
