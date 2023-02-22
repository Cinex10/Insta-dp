import 'package:equatable/equatable.dart';

class StoryItem extends Equatable {
  final bool isVideo;
  final String imageUrl;
  final String? videoUrl;

  const StoryItem({
    required this.isVideo,
    required this.imageUrl,
    this.videoUrl,
  });

  @override
  List<Object> props() => [
        isVideo,
        imageUrl,
      ];
}
