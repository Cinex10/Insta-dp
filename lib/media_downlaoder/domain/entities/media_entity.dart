import 'package:equatable/equatable.dart';
import 'package:insta_dp/core/models/dimension.dart';

class Media extends Equatable {
  final String url;
  final String text;
  final String thumbnail;
  final String ownerUsername;
  final String ownerProfilePic;
  final Dimension dimension;
  final double? duration;
  final bool isVideo;

  const Media({
    required this.url,
    required this.isVideo,
    required this.dimension,
    required this.text,
    required this.thumbnail,
    required this.ownerUsername,
    required this.ownerProfilePic,
    this.duration,
  });

  @override
  List<Object> props() => [
        url,
        text,
        thumbnail,
        ownerUsername,
        ownerProfilePic,
        dimension,
        isVideo,
      ];
}
