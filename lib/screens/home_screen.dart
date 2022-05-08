import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie_class.dart';
import 'package:movie_app/screens/movie_details.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Movie> movies = [];
  List<Movie> newMoviesList = [];
  bool doneLoading = false;
  bool comedy = false;
  bool action = false;
  bool crime = false;
  bool drama = false;
  bool romance = false;
  bool mystery = false;

  @override
  void initState() {
    getAllMovies();
    super.initState();
  }

  void getAllMovies() async {
    // List<int> listOfNumbers = List<int>.generate(118, (i) => i + 100);
    // for (var i in listOfNumbers) {
    //   if (i > 118) {
    //     setState(() {
    //       doneLoading = true;
    //     });
    //     return;
    //   }
    List<int> listOfNumbers = List<int>.generate(150, (i) => i + 100);
    for (var i in listOfNumbers) {
      if (i > 150) {
        setState(() {
          doneLoading = true;
        });
        return;
      }
      Uri url = Uri.parse(
          'https://api.themoviedb.org/3/movie/$i?api_key=b29addac29195cb9a641429eb60d9c32');
      http.Response response = await http.get(url);
      Map<String, dynamic> jsonResponse;
      if (response.statusCode == 200) {
        jsonResponse =
            await convert.jsonDecode(response.body) as Map<String, dynamic>;
        movies.add(Movie(
            id: jsonResponse["id"],
            title: jsonResponse["original_title"],
            overview: jsonResponse["overview"],
            category1: jsonResponse["genres"][0]['name'],
            rate: jsonResponse["vote_average"].toString(),
            releaseDate: jsonResponse["release_date"].toString(),
            posterPath: jsonResponse["poster_path"]));
        newMoviesList = movies;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    }
  }

  void getSpecificCategory(){
    if(comedy == true)
      {
        setState(() {
          newMoviesList = movies.where((movie) => movie.category1 == "Comedy").toList();
        });
      }
    else if(action == true)
    {
      setState(() {
        newMoviesList = movies.where((movie) => movie.category1 == "Action").toList();
      });
    }
    else if(crime == true)
    {
      setState(() {
        newMoviesList = movies.where((movie) => movie.category1 == "Crime").toList();
      });
    }
    else if(drama == true)
    {
      setState(() {
        newMoviesList = movies.where((movie) => movie.category1 == "Drama").toList();
      });
    }
    else if(romance == true)
    {
      setState(() {
        newMoviesList = movies.where((movie) => movie.category1 == "Romance").toList();
      });
    }
    else if(mystery == true)
    {
      setState(() {
        newMoviesList = movies.where((movie) => movie.category1 == "Mystery").toList();
      });
    }
    else{
      newMoviesList = movies;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: doneLoading == true ? SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text("Movie App", style: TextStyle(fontSize: 40),),
            const SizedBox(height: 6),
            Expanded(
              flex: 1,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: !comedy && !action && !crime && !drama && !romance && !mystery ? Colors.grey.withOpacity(0.6) : Colors.grey.withOpacity(0.2),
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          comedy = false;
                          action = false;
                          crime = false;
                          drama = false;
                          romance = false;
                          mystery = false;
                        });
                        getSpecificCategory();
                      },
                      child: const FittedBox(
                        child: Text(
                          "All",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: comedy ? Colors.grey.withOpacity(0.6) : Colors.grey.withOpacity(0.2),
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          comedy = true;
                          action = false;
                          crime = false;
                          drama = false;
                          romance = false;
                          mystery = false;
                        });
                        getSpecificCategory();
                      },
                      child: const FittedBox(
                        child: Text(
                          "Comedy",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: action ? Colors.grey.withOpacity(0.6) : Colors.grey.withOpacity(0.2),
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          comedy = false;
                          action = true;
                          crime = false;
                          drama = false;
                          romance = false;
                          mystery = false;
                        });
                        getSpecificCategory();
                      },
                      child: const FittedBox(
                        child: Text(
                          "Action",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: crime ? Colors.grey.withOpacity(0.6) : Colors.grey.withOpacity(0.2),
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          comedy = false;
                          action = false;
                          crime = true;
                          drama = false;
                          romance = false;
                          mystery = false;
                        });
                        getSpecificCategory();
                      },
                      child: const FittedBox(
                        child: Text(
                          "Crime",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: drama ? Colors.grey.withOpacity(0.6) : Colors.grey.withOpacity(0.2),
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          comedy = false;
                          action = false;
                          crime = false;
                          drama = true;
                          romance = false;
                          mystery = false;
                        });
                        getSpecificCategory();
                      },
                      child: const FittedBox(
                        child: Text(
                          "Drama",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: romance ? Colors.grey.withOpacity(0.6) : Colors.grey.withOpacity(0.2),
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          comedy = false;
                          action = false;
                          crime = false;
                          drama = false;
                          romance = true;
                          mystery = false;
                        });
                        getSpecificCategory();
                      },
                      child: const FittedBox(
                        child: Text(
                          "Romance",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: mystery ? Colors.grey.withOpacity(0.6) : Colors.grey.withOpacity(0.2),
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          comedy = false;
                          action = false;
                          crime = false;
                          drama = false;
                          romance = false;
                          mystery = true;
                        });
                        getSpecificCategory();
                      },
                      child: const FittedBox(
                        child: Text(
                          "Mystery",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),

            Expanded(
              flex: 10,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 4 / 5.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: newMoviesList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MovieDetailsScreen(newMoviesList[index])),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Hero(
                          tag: "Pic${newMoviesList[index].id}",
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: 'https://image.tmdb.org/t/p/original/' +
                                newMoviesList[index].posterPath.toString(),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ) : const Center(child: CircularProgressIndicator(color: Colors.white,)),
    );
  }
}
