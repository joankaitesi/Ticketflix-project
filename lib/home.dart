import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(TicketFlix());
}

const apiKey = '5526d94af26fb8d0905d68dc8db5d6ad';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterUrl;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterUrl,
  });
}

class TicketFlix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TicketFlix',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {},
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Add logic here for the menu button
          },
        ),
        title: Text(
          "TICKETFLIX",
          style: TextStyle(
            color: Colors.red,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Add logic here for the notification button
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Add the logic for the profile here
            },
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                // Add your logic here for handling search input
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView(
                    padding: EdgeInsets.all(16.0),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      MovieCategoryWidget(
                        categoryTitle: 'Coming Soon',
                        apiUrl:
                            'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey',
                      ),
                      SizedBox(height: 16.0),
                      MovieCategoryWidget(
                        categoryTitle: 'Trending',
                        apiUrl:
                            'https://api.themoviedb.org/3/movie/day?api_key=$apiKey',
                      ),
                      SizedBox(height: 16.0),
                      MovieCategoryWidget(
                        categoryTitle: 'Recommended',
                        apiUrl:
                            'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey',
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/HomeScreen');
              },
              color: Colors.white,
              textColor: Colors.black,
              child: const Text(
                'Home',
                style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              ),
            ),
            MaterialButton(
              onPressed: () {
                // Add the navigation code for the live stream
              },
              color: Colors.white,
              textColor: Colors.black,
              child: const Text(
                'Live Stream',
                style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              ),
            ),
            MaterialButton(
              onPressed: () {
                // Add the navigation code for movies
              },
              color: Colors.white,
              textColor: Colors.black,
              child: const Text(
                'Movies',
                style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieCategoryWidget extends StatefulWidget {
  final String categoryTitle;
  final String apiUrl;

  const MovieCategoryWidget({
    required this.categoryTitle,
    required this.apiUrl,
  });

  @override
  _MovieCategoryWidgetState createState() => _MovieCategoryWidgetState();
}

class _MovieCategoryWidgetState extends State<MovieCategoryWidget> {
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    try {
      final response = await http.get(Uri.parse(widget.apiUrl));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        List<Movie> loadedMovies = [];
        for (var movieData in jsonData['results']) {
          loadedMovies.add(
            Movie(
              id: movieData['id'] ?? 0,
              title: movieData['title'] ?? '',
              overview: movieData['overview'] ?? '',
              posterUrl:
                  'https://image.tmdb.org/t/p/w500${movieData['poster_path'] ?? ''}',
            ),
          );
        }

        setState(() {
          movies = loadedMovies;
        });
      } else {
        // Handle error
        print('Failed to fetch movies for ${widget.categoryTitle}');
      }
    } catch (e) {
      // Handle error
      print(
          'Error occurred while fetching movies for ${widget.categoryTitle}: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.categoryTitle,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          height: 200.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.network(movie.posterUrl),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      movie.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
