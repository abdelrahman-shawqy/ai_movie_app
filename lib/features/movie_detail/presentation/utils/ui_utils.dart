import 'package:share_plus/share_plus.dart';

class UiUtils {
  static Future<void> shareMovieLink({
    required int movieId,
    required String movieTitle,
  }) async {
    final movieUrl =
        'https://www.themoviedb.org/movie/$movieId';

    final shareText = 'Check Out The Link of $movieTitle:\n$movieUrl';

    await SharePlus.instance.share(
      ShareParams(text: shareText),
    );
  }
}