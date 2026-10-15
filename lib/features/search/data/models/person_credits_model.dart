

class PersonCreditsResponse {
  final int id;
  final List<CrewModel> crew;
  final List<CastModel> cast;

  const PersonCreditsResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory PersonCreditsResponse.fromJson(
      Map<String, dynamic> json,
      ) {
    return PersonCreditsResponse(
      id: json['id'] as int? ?? 0,

      cast: (json['cast'] as List<dynamic>? ?? [])
          .map(
            (item) => CastModel.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList(),

      crew: (json['crew'] as List<dynamic>? ?? [])
          .map(
            (item) => CrewModel.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList(),
    );
  }
}



class CastModel {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String? originalLanguage;
  final String? originalTitle;
  final String overview;
  final num popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final num voteAverage;
  final int voteCount;
  final String? character;
  final String creditId;
  final int order;
  final String mediaType;

  const CastModel({
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
    required this.character,
    required this.creditId,
    required this.order,
    required this.mediaType,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      adult: json['adult'] as bool? ?? false,
      backdropPath: json['backdrop_path'] as String?,

      genreIds: (json['genre_ids'] as List<dynamic>? ?? [])
          .map((id) => id as int)
          .toList(),

      id: json['id'] as int? ?? 0,
      originalLanguage: json['original_language'] as String?,
      originalTitle:
      (json['original_title'] ?? json['original_name'])
      as String?,

      overview: json['overview'] as String? ?? '',

      popularity: json['popularity'] as num? ?? 0,
      posterPath: json['poster_path'] as String?,

      releaseDate:
      (json['release_date'] ?? json['first_air_date'])
      as String?,

      title: (json['title'] ?? json['name']) as String?,

      video: json['video'] as bool?,

      voteAverage: json['vote_average'] as num? ?? 0,
      voteCount: json['vote_count'] as int? ?? 0,

      character: json['character'] as String?,
      creditId: json['credit_id'] as String? ?? '',
      order: json['order'] as int? ?? 0,
      mediaType: json['media_type'] as String? ?? '',
    );
  }
}



class CrewModel {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String? originalLanguage;
  final String? originalTitle;
  final String overview;
  final num popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final num voteAverage;
  final int voteCount;
  final String creditId;
  final String? department;
  final String? job;
  final String mediaType;

  const CrewModel({
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
    required this.creditId,
    required this.department,
    required this.job,
    required this.mediaType,
  });

  factory CrewModel.fromJson(Map<String, dynamic> json) {
    return CrewModel(
      adult: json['adult'] as bool? ?? false,
      backdropPath: json['backdrop_path'] as String?,

      genreIds: (json['genre_ids'] as List<dynamic>? ?? [])
          .map((id) => id as int)
          .toList(),

      id: json['id'] as int? ?? 0,
      originalLanguage: json['original_language'] as String?,
      originalTitle:
      (json['original_title'] ?? json['original_name'])
      as String?,

      overview: json['overview'] as String? ?? '',

      popularity: json['popularity'] as num? ?? 0,
      posterPath: json['poster_path'] as String?,

      releaseDate:
      (json['release_date'] ?? json['first_air_date'])
      as String?,

      title: (json['title'] ?? json['name']) as String?,

      video: json['video'] as bool?,

      voteAverage: json['vote_average'] as num? ?? 0,
      voteCount: json['vote_count'] as int? ?? 0,

      creditId: json['credit_id'] as String? ?? '',
      department: json['department'] as String?,
      job: json['job'] as String?,
      mediaType: json['media_type'] as String? ?? '',
    );
  }
}

