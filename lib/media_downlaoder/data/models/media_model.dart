import 'package:insta_dp/core/models/dimension.dart';
import 'package:insta_dp/media_downlaoder/domain/entities/media_entity.dart';

class MediaModel extends Media {
  const MediaModel(
      {required super.url,
      required super.dimension,
      required super.text,
      required super.thumbnail,
      required super.isVideo,
      required super.ownerUsername,
      required super.ownerProfilePic,
      super.duration});

  factory MediaModel.fromJson(Map<String, dynamic> json) => MediaModel(
        isVideo: json['is_video'],
        url: (json['is_video'] as bool)
            ? json['video_url']
            : json['display_url'],
        dimension: Dimension.fromJson(json['dimensions']),
        text: json['edge_media_to_caption']['edges'][0]['node']['text'],
        thumbnail: json['display_url'],
        ownerProfilePic: json['owner']['profile_pic_url'],
        ownerUsername: json['owner']['username'],
        duration: (json['is_video'] as bool) ? json['video_duration'] : null,
      );
}
