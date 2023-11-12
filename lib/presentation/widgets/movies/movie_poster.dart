import 'package:animate_do/animate_do.dart';
import 'package:cinema_wisdom/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/home/0/movie/${movie.id}'),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInUp(
          duration: const Duration(seconds: 1),
          child: Image.network(
            movie.posterPath,
          ),
        ),
      ),
    );
  }
}
