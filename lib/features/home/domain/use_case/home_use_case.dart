import 'package:ai_movie_app/core/error/failure.dart';
import 'package:ai_movie_app/features/home/data/models/movie_list_model.dart';
import 'package:ai_movie_app/features/home/domain/remote_repository/remote_home_repository.dart';
import 'package:fpdart/fpdart.dart';

class HomeUseCase {
  HomeUseCase(this.remoteHomeRepository);
  final RemoteHomeRepository remoteHomeRepository ;
  Future<Either<Failure, MovieListModel>>callMovieList()async {
  var movieList = await remoteHomeRepository.getMovieListData();
  return movieList ;
  }

}