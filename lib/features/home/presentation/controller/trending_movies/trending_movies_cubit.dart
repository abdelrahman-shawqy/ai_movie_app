import 'package:ai_movie_app/features/home/data/models/trending_movies_model.dart';
import 'package:ai_movie_app/features/home/domain/use_case/home_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'trending_movies_state.dart';

class TrendingMoviesCubit extends Cubit<TrendingMoviesState> {
  TrendingMoviesCubit(this.homeUseCase) : super(TrendingMoviesLoading());
  final HomeUseCase homeUseCase ;
  Future<void>getTrendingMovies()async{
    emit(TrendingMoviesLoading());
    var trendingMovies =await homeUseCase.callTrendingMoviesData();
    trendingMovies.fold((error){
      emit(TrendingMoviesError(error.errorMessage));
    }, (success){
      emit(TrendingMoviesSuccess(success.results));
    });
  }

}
