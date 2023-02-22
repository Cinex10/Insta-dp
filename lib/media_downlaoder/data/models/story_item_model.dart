import 'package:insta_dp/media_downlaoder/domain/entities/story_item_entity.dart';

class StoryItemModel extends StoryItem {
  const StoryItemModel({
    required super.isVideo,
    required super.imageUrl,
    super.videoUrl,
  });

  factory StoryItemModel.fromJson(Map<String, dynamic> json) {
    // print('wsal');
    return StoryItemModel(
      isVideo: (json['media_type'] as int == 2),
      imageUrl:
          (json['image_versions2']['candidates'] as List)[0]['url'] as String,
      videoUrl: (json['media_type'] as int == 2)
          ? (json['video_versions'] as List)[0]['url'] as String
          : null,
    );
  }

  static List<StoryItemModel> listFromJson(List<dynamic> jsons) =>
      List<StoryItemModel>.from(
          jsons.map((json) => StoryItemModel.fromJson(json)));
}
