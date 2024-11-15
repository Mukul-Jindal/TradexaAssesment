class Movie {
  late String title;
  late String poster;
  late double rating;
  late String genre;
  late List<String>? listGenre;

  Movie({
    required this.title,
    required this.poster,
    required this.rating,
    required this.genre,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    Movie temp = Movie(
      title: json["Title"],
      poster: json["Poster"],
      rating: double.parse(json["imdbRating"]),
      genre: json["Genre"],
    );
    temp.listGenre = temp.genre.split(',');
    temp.genre = "";
    for (int i = 0; i < temp.listGenre!.length; i++) {
      temp.genre = temp.genre + temp.listGenre![i] + " | ";
    }
    temp.genre = temp.genre.substring(0, temp.genre.length - 2);
    return temp;
  }
}
