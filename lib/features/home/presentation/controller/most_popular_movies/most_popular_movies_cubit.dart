import 'package:ai_movie_app/features/home/data/models/most_popular_movies_model.dart';
import 'package:ai_movie_app/features/home/domain/use_case/home_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'most_popular_movies_state.dart';

class MostPopularMoviesCubit extends Cubit<MostPopularMoviesState> {
  MostPopularMoviesCubit(this.homeUseCase) : super(MostPopularMoviesLoading());
  final HomeUseCase homeUseCase ;
  Future<void>getMostPopularMovies(int movieListId)async {
    print(' ### CUBIT RECEIVED ID = $movieListId');

    emit(MostPopularMoviesLoading());
    var mostPopularMovies =await homeUseCase.callMostPopularMoviesData(movieListId);
    mostPopularMovies.fold((error){
      emit(MostPopularMoviesError(error.errorMessage));
    }, (success){
      print('getMostPopularMovies ####### ');

      emit(MostPopularMoviesSuccess(success.results));
    });
  }

  /// TODO refactor this function to has the list from api




  }

