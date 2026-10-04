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
   String getGenreName(int catId){
    final  Map<int,String>genreMap = {
     28 : "Action",
      12 : "Abenteuer" ,
      16 : "Animation" ,
      35 : "Komödie" ,
      80 : "Krimi",
      99 : "Dokumentarfilm" ,
      18 : "Drama" ,
      10751 : "Familie" ,
      14 : "Fantasy" ,
      36 : "Historie" ,
      27 : "Horror" ,
      10402 : "Musik",
      9648 : "Mystery" ,
      10749 : "Liebesfilm" ,
      878 : "Science Fiction" ,
      10770 : "TV-Film" ,
      53 :  "Thriller" ,
      10752 : "Kriegsfilm" ,
      37 : "Western"
    };
    return genreMap[catId] ?? "Unavailable" ;

  }


  String getImage(String posterPath){
    return 'https://image.tmdb.org/t/p/original/${posterPath}' ;
  }
  }

