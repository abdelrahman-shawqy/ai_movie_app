class ApiUtils {
  static String getPosterImage(String posterPath){
    final String baseUrlImage  = "https://image.tmdb.org/t/p/original/" ;
    return '${baseUrlImage}${posterPath}' ;
  }
  static String getBackDropImage(String posterPath){
    final String baseUrlImage  = "https://image.tmdb.org/t/p/w1280" ;
    return '${baseUrlImage}${posterPath}' ;
  }
  static String getGenreName(List<int> genreIds){

    if(genreIds.isEmpty){
      return 'Unavailable';
    }
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
    return genreMap[genreIds.first] ?? "Unavailable" ;

  }
  static String formatTitleForMovieResult(String title){
    if(title.isEmpty){
      return "Unavailable" ;
    }
    return title ;
  }
  static String formatVoteAverageForMovieResult(num voteAverage){
    if(voteAverage<=1){
      return '0.0' ;
    }
    return voteAverage.toStringAsFixed(1);
  }
  static String formatReleaseDateWithYearForMovieResult(String releaseDate){
    if(releaseDate.length<=4){
      return "Unavailable" ;
    }
    return releaseDate.substring(0,4) ;
  }
}