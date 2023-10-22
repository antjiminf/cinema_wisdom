import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key, required this.movieId});

  final String movieId;

  static const String name = 'movie-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieId: $movieId'),
      ),
      // body: ,
    );
  }
}
