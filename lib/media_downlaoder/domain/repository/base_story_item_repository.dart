import 'package:dartz/dartz.dart';
import 'package:insta_dp/core/error/failure.dart';
import 'package:insta_dp/media_downlaoder/data/models/story_item_model.dart';

abstract class BaseStoryItemRepository {
  Future<Either<Failure, List<StoryItemModel>>> getStories(String idUser);

  Future<Either<Failure, String>> getUserId(String username);
  Future<Either<Failure, List<StoryItemModel>>> getHighlight(
      String idHighlight);
}
