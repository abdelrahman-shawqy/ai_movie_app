class MovieListModel {
  MovieListModel({required this.genres});
final List<MovieList> genres;
  factory MovieListModel.fromJson(Map<String,dynamic>json){
  return MovieListModel(
    genres : (json['genres'] as List ).map((e)=>MovieList.fromJson(e)).toList()
  );
}
  Map<String,dynamic>toJson(){
    return {
      'genres' : genres.map((e)=>e.movieListToJson()).toList()
    };
 }

}

class MovieList {
  MovieList({required this.id ,required this.name});
  final int id ;
  final String name ;

  factory MovieList.fromJson(Map<String,dynamic>json){
    return MovieList (
      id:json['id'] as int ,
      name:json['name'] as String
    );
  }

  Map<String,dynamic>movieListToJson(){
    return {
      'id':id,
      'name': name
    };
  }
}