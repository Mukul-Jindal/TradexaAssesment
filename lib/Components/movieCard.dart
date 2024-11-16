import 'package:flutter/material.dart';
import 'package:tradexaassignment/Components/constants.dart';
import 'package:tradexaassignment/model/movieInfo.dart';

Container movieCard(BuildContext context, Movie movie) {
  return Container(
    height: 300,
    decoration: const BoxDecoration(
      color: Colors.transparent,
    ),
    child: Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          alignment: Alignment.bottomRight,
          height: 180,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: fontSizeConstants.title,
                      ),
                    ),
                    Text(
                      movie.genre,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: movie.rating > 7.0
                            ? colorConstants.highRatingColor
                            : colorConstants.lowRatingColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "${movie.rating} IMDB",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorConstants.ratingColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 290,
          margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(
                movie.poster,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    ),
  );
}
