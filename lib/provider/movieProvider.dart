import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import '../model/movieInfo.dart';

class movieProvider extends ChangeNotifier {
  List<Movie>? movies;
  String? error;
  Future<List<Movie>?> getMovie(String querry) async {
    querry = querry.replaceAll(" ", "+");
    try {
      error = null;
      var url =
          Uri.parse("https://www.omdbapi.com/?t=${querry}&apikey=4c4294e0");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        body = [body]; // if body return list of json then remove this
        movies = [];
        body.forEach((e) {
          movies!.add(Movie.fromJson(e));
        });
      }
    } catch (e) {
      error = e.toString();
    }
    notifyListeners();
    return null;
  }

  movieProvider() {
    getMovie('The Maze Runner');
  }
}
