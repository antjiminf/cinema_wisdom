import 'package:cinema_wisdom/presentation/providers/movies/movie_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinema_wisdom/domain/entities/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final FutureProviderFamily<List<Video>, int> videosByMovieProvider =
    FutureProvider.family(
  (ref, int movieId) {
    final movieRepository = ref.watch(movieRepositoryProvider);
    return movieRepository.getYoutubeVideosById(movieId);
  },
);

class VideoByMovie extends ConsumerWidget {
  const VideoByMovie({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context, ref) {
    final videosByMovie = ref.watch(videosByMovieProvider(movieId));
    return videosByMovie.when(
      data: (videos) => _Videos(videos: videos),
      error: (_, __) => const Center(
        child: Text('Sorry, we were unable to fetch similar movies'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}

class _Videos extends StatelessWidget {
  const _Videos({required this.videos});

  final List<Video> videos;

  @override
  Widget build(BuildContext context) {
    if (videos.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Trailer',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        _YoutubeVideoPlayer(
          youtubeKey: videos.first.youtubeKey,
          name: videos.first.name,
        ),
      ],
    );
  }
}

class _YoutubeVideoPlayer extends StatefulWidget {
  const _YoutubeVideoPlayer({
    required this.youtubeKey,
    required this.name,
  });

  final String youtubeKey;
  final String name;

  @override
  State<_YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<_YoutubeVideoPlayer> {
  late YoutubePlayerController youtubeController;

  @override
  void initState() {
    super.initState();
    youtubeController = YoutubePlayerController(
      initialVideoId: widget.youtubeKey,
      flags: const YoutubePlayerFlags(
        hideThumbnail: true,
        showLiveFullscreenButton: false,
        mute: false,
        autoPlay: false,
        disableDragSeek: true,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      ),
    );
  }

  @override
  void dispose() {
    youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5, left: 5),
            child: Text(widget.name),
          ),
          YoutubePlayer(controller: youtubeController),
        ],
      ),
    );
  }
}
