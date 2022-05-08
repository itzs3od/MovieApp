import 'package:flutter/material.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String category1;
  final String rate;
  final String releaseDate;
  final String posterPath;

   Movie(
      {required this.id,
      required this.title,
      required this.overview,
      required this.category1,
      required this.rate,
      required this.releaseDate,
      required this.posterPath});


}
