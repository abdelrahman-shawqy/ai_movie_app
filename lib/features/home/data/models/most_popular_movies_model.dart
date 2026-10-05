class MostPopularMoviesModel {
  MostPopularMoviesModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  final int page;
  final List<ResultsMostPopularMoviesModel> results;
  final int totalPages;
  final int totalResults;

  factory MostPopularMoviesModel.fromJson(Map<String, dynamic> json) {
    return MostPopularMoviesModel(
      page: json['page'] as int,
      results: (json['results']as List).map((e)=>ResultsMostPopularMoviesModel.fromjson(e)).toList(),
      totalPages: json['total_pages'] as int ,
      totalResults: json['total_results'] as int ,
    );
  }
}

class ResultsMostPopularMoviesModel {
  ResultsMostPopularMoviesModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final num popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final num voteAverage;
  final int voteCount;

  factory ResultsMostPopularMoviesModel.fromjson(Map<String, dynamic> json) {
    return ResultsMostPopularMoviesModel(
      adult: json['adult']as bool,
      backdropPath: json['backdrop_path']as String ,
      genreIds: (json['genre_ids'] as List).cast(),
      id: json['id'] as int ,
      originalLanguage: json['original_language']as String,
      originalTitle: json['original_title'] as String ,
      overview: json['overview'] as String  ,
      popularity: json['popularity'] as num ,
      posterPath: json['poster_path'] as String ,
      releaseDate: json['release_date'] as String ,
      title: json['title'] as String  ,
      video: json['video'] as bool ,
      voteAverage: json['vote_average'] as num ,
      voteCount: json['vote_count'] as int ,
    );
  }
}
