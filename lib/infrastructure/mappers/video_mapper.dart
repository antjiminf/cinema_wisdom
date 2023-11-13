import 'package:cinema_wisdom/domain/entities/video.dart';
import 'package:cinema_wisdom/infrastructure/models/moviedb/moviedb_videos.dart';

class VideoMapper {
  static moviedbVideoToEntity(VideoResult moviedbVideo) => Video(
      id: moviedbVideo.id,
      name: moviedbVideo.name,
      youtubeKey: moviedbVideo.key,
      publishedAt: moviedbVideo.publishedAt);
}
