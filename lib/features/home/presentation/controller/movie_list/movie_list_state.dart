part of 'movie_list_cubit.dart';

@immutable
sealed class MovieListState extends Equatable{}

final class MovieListLoading extends MovieListState {
  @override
  List<Object?> get props => [];
}
final class MovieListSuccess extends MovieListState {
  MovieListSuccess(this.movieList);

  final List<MovieList>movieList ;
  @override
  List<Object?> get props =>[movieList] ;

}
final class MovieListError extends MovieListState {
  final String errorMessage ;
  MovieListError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
