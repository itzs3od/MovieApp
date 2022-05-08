import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../models/movie_class.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Movies App")),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Hero(
                    tag: "Pic${movie.id}",
                    child: Image.network(
                      'https://image.tmdb.org/t/p/original/' +
                          movie.posterPath.toString(),
                      fit: BoxFit.fitWidth,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: Text(
                            movie.category1.toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                movie.rate.toString(),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Text(
                              movie.releaseDate.toString(),
                              textAlign: TextAlign.end,
                              style: const TextStyle(fontSize: 18),
                            )),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Text(
                      movie.title.toString(),
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(movie.overview.toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.arrow_back,
          size: 30,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
