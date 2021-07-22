import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movieboss/Models/MovieResults.dart';
import 'package:http/http.dart' as http;

class MovieSearchController with ChangeNotifier {
  MovieResultsModel? _movieResults;
  MovieResultsModel? get movieResults => _movieResults;

  getMovieResult(context, String rq) async {
    final queryParameters = {
      "q": rq,
    };
    final uri =
        Uri.https('imdb8.p.rapidapi.com', '/auto-complete', queryParameters);

    Map<String, String> hdrs = {
      "x-rapidapi-key": "33f70fd65dmsh37966706e7b5de4p1cc3e6jsn15785326bccc",
      "x-rapidapi-host": "imdb8.p.rapidapi.com",
      "useQueryString": "true",
    };
    var response = await http.get(uri, headers: hdrs);

    if (response.statusCode == 200) {
      print(response.statusCode);
      _movieResults = movieResultsModelFromJson(response.body);
      notifyListeners();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Got results')));
    } else {
      print(response.statusCode);
      print(response.body);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Something went wrong')));
    }
    notifyListeners();
  }
}
