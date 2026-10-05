part of 'most_popular_movies_cubit.dart';

@immutable
sealed class MostPopularMoviesState extends Equatable {}

final class MostPopularMoviesLoading extends MostPopularMoviesState {
  @override
  List<Object?> get props => [];
}
final class MostPopularMoviesSuccess extends MostPopularMoviesState {
  MostPopularMoviesSuccess(this.resultsMostPopularMoviesModel);
  final List<ResultsMostPopularMoviesModel>resultsMostPopularMoviesModel ;
  @override
  List<Object?> get props => [resultsMostPopularMoviesModel];
}
final class MostPopularMoviesError extends MostPopularMoviesState {
  MostPopularMoviesError(this.errorMessage);
  final String errorMessage ;
  @override
  List<Object?> get props => [errorMessage];
}
