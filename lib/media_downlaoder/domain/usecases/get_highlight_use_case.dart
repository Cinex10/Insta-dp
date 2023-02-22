import 'package:dartz/dartz.dart';
import 'package:insta_dp/core/error/failure.dart';
import 'package:insta_dp/media_downlaoder/domain/repository/base_story_item_repository.dart';

import '../../data/models/story_item_model.dart';

class GetHighlightUseCase {
  final BaseStoryItemRepository storyItemRepository;

  GetHighlightUseCase(
    this.storyItemRepository,
  );

  Future<Either<Failure, List<StoryItemModel>>> execute(
      String idHighlight) async {
    return await storyItemRepository.getHighlight(idHighlight);
  }
}
