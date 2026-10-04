import 'package:ai_movie_app/features/home/data/models/movie_list_model.dart';
import 'package:ai_movie_app/features/home/domain/use_case/home_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'movie_list_state.dart';

class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit(this.homeUseCase) : super(MovieListLoading());
  final HomeUseCase homeUseCase;

  //


  Future<void> getMovieList() async {

    emit(MovieListLoading());
    var movieList = await homeUseCase.callMovieList();
    movieList.fold((error) => emit(MovieListError(error.errorMessage)), (
      success,
    ) {
      //
      print('getMovieList ####### ');
      final MovieList all = MovieList(name: 'All', id: 1);
      final List<MovieList> allMovieList = [all, ...success.genres];
      return emit(MovieListSuccess(allMovieList));
    });
  }


}
