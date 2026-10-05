class TrendingMoviesModel {
  final int page;
  final List<TrendingMovieResultModel> results;
  final int totalPages;
  final int totalResults;

  TrendingMoviesModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TrendingMoviesModel.fromJson(Map<String, dynamic> json) {
    return TrendingMoviesModel(
      page: json['page'] as int,
      results: (json['results'] as List)
          .map((e) => TrendingMovieResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );
  }
}

class TrendingMovieResultModel {
  final bool adult;
  final String backdropPath;
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String mediaType;
  final String originalLanguage;
  final List<int> genreIds;
  final num popularity;
  final String releaseDate;
  final bool softcore;
  final bool video;
  final num voteAverage;
  final int voteCount;

  TrendingMovieResultModel({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.softcore,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TrendingMovieResultModel.fromJson(Map<String, dynamic> json) {
    return TrendingMovieResultModel(
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String,
      id: json['id'] as int,
      title: json['title'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String,
      mediaType: json['media_type'] as String,
      originalLanguage: json['original_language'] as String,
      genreIds: (json['genre_ids'] as List).map((e) => e as int).toList(),
      popularity: json['popularity'] as num,
      releaseDate: json['release_date'] as String,
      softcore: json['softcore'] as bool,
      video: json['video'] as bool,
      voteAverage: json['vote_average'] as num,
      voteCount: json['vote_count'] as int,
    );
  }
}
