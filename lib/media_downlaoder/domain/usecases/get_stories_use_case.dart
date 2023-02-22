// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:insta_dp/core/error/failure.dart';
import 'package:insta_dp/media_downlaoder/data/models/story_item_model.dart';
import 'package:insta_dp/media_downlaoder/domain/repository/base_story_item_repository.dart';

class GetStoriesUseCase {
  final BaseStoryItemRepository storyItemRepository;

  GetStoriesUseCase(
    this.storyItemRepository,
  );

  Future<Either<Failure, List<StoryItemModel>>> execute(String idUser) async {
    return await storyItemRepository.getStories(idUser);
  }
}
