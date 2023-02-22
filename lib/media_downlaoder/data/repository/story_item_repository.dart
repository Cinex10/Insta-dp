// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:insta_dp/core/error/exception.dart';
import 'package:insta_dp/core/error/failure.dart';
import 'package:insta_dp/media_downlaoder/data/datasource/story_item_remote_data_source.dart';
import 'package:insta_dp/media_downlaoder/data/models/story_item_model.dart';
import 'package:insta_dp/media_downlaoder/domain/repository/base_story_item_repository.dart';

class StoryItemRepository extends BaseStoryItemRepository {
  final BaseStoryItemRemoteDataSource storyItemRemoteDataSource;
  StoryItemRepository({
    required this.storyItemRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<StoryItemModel>>> getStories(
      String idUser) async {
    try {
      final result = await storyItemRemoteDataSource.getStories(idUser);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        Failure(message: failure.message),
      );
    }
  }

  @override
  Future<Either<Failure, String>> getUserId(String username) async {
    try {
      final result = await storyItemRemoteDataSource.getUserId(username);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        Failure(message: failure.message),
      );
    }
  }

  @override
  Future<Either<Failure, List<StoryItemModel>>> getHighlight(
      String idHighlight) async {
    try {
      final result = await storyItemRemoteDataSource.getHighlight(idHighlight);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        Failure(message: failure.message),
      );
    }
  }
}
