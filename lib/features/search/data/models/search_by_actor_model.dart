
class SearchByActorModel {
  final int page;
  final List<PersonResultsModel> results;
  final int totalPages;
  final int totalResults;

  const SearchByActorModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchByActorModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return SearchByActorModel(
      page: json['page'] as int? ?? 1,
      results: (json['results'] as List<dynamic>? ?? [])
          .map(
            (item) => PersonResultsModel.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList(),
      totalPages: json['total_pages'] as int? ?? 0,
      totalResults: json['total_results'] as int? ?? 0,
    );
  }
}



class PersonResultsModel {
  final int id;
  final String name;
  final String originalName;
  final bool adult;
  final int gender;
  final String knownForDepartment;
  final double popularity;
  final String? profilePath;
  final List<KnownForModel> knownFor;

  const PersonResultsModel({
    required this.id,
    required this.name,
    required this.originalName,
    required this.adult,
    required this.gender,
    required this.knownForDepartment,
    required this.popularity,
    required this.profilePath,
    required this.knownFor,
  });

  factory PersonResultsModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return PersonResultsModel(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      originalName:
      json['original_name'] as String? ?? '',
      adult: json['adult'] as bool? ?? false,
      gender: json['gender'] as int? ?? 0,
      knownForDepartment:
      json['known_for_department'] as String? ?? '',
      popularity:
      (json['popularity'] as num?)?.toDouble() ?? 0.0,
      profilePath: json['profile_path'] as String?,
      knownFor: (json['known_for'] as List<dynamic>? ?? [])
          .map(
            (item) => KnownForModel.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList(),
    );
  }
}



class KnownForModel {
  final int id;
  final String mediaType;
  final String title;
  final String? posterPath;
  final String? releaseDate;

  const KnownForModel({
    required this.id,
    required this.mediaType,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
  });

  factory KnownForModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return KnownForModel(
      id: json['id'] as int,
      mediaType: json['media_type'] as String? ?? '',
      title: (json['title'] ?? json['name']) as String? ?? '',
      posterPath: json['poster_path'] as String?,
      releaseDate: (json['release_date'] ?? json['first_air_date'])
      as String?,
    );
  }
}
