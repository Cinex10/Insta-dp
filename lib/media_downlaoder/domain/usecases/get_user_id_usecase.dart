import 'package:dartz/dartz.dart';
import 'package:insta_dp/core/error/failure.dart';
import 'package:insta_dp/media_downlaoder/domain/repository/base_story_item_repository.dart';

class GetUserIdUseCase {
  final BaseStoryItemRepository storyItemRepository;

  GetUserIdUseCase(this.storyItemRepository);

  Future<Either<Failure, String>> execute(String username) async {
    return await storyItemRepository.getUserId(username);
  }
}
