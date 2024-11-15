import 'package:flutter/material.dart';
import 'package:tradexaassignment/Components/constants.dart';
import 'package:tradexaassignment/provider/movieProvider.dart';

Container searchButton(TextEditingController searchController, movieProvider service) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: marzinConstants.horizontal,
    ),
    child: TextField(
      controller: searchController,
      decoration: const InputDecoration(
        hintText: 'Search',
        suffixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorConstants.headingColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorConstants.headingColor,
          ),
        ),
      ),
      onSubmitted: (value) {
        service.getMovie(value);
      },
    ),
  );
}
