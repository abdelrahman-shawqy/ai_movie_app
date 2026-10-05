part of 'trending_movies_cubit.dart';

@immutable
sealed class TrendingMoviesState extends Equatable{}

final class TrendingMoviesLoading extends TrendingMoviesState {
  @override
  List<Object?> get props => [];
}
final class TrendingMoviesSuccess extends TrendingMoviesState {
  TrendingMoviesSuccess(this.trendingMovieResultModel);

  final List<TrendingMovieResultModel> trendingMovieResultModel ;
  @override
  List<Object?> get props => [trendingMovieResultModel];
}
final class TrendingMoviesError extends TrendingMoviesState {
  TrendingMoviesError(this.errorMessage);
  final String errorMessage ;
  @override
  List<Object?> get props => [errorMessage];
}
