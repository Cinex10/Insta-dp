import 'package:dartz/dartz.dart';
import 'package:insta_dp/core/error/exception.dart';
import 'package:insta_dp/core/error/failure.dart';
import 'package:insta_dp/media_downlaoder/data/datasource/media_remote_data_source.dart';
import 'package:insta_dp/media_downlaoder/data/models/media_model.dart';
import 'package:insta_dp/media_downlaoder/domain/repository/base_media_repository.dart';

class MediaRepository extends BaseMediaRepository {
  final BaseMediaRemoteDataSource mediaRemoteDataSource;
  MediaRepository({
    required this.mediaRemoteDataSource,
  });

  @override
  Future<Either<Failure, MediaModel>> getVideo(String shortcode) async {
    try {
      final result = await mediaRemoteDataSource.getVideo(shortcode);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        Failure(message: failure.message),
      );
    }
  }

  @override
  Future<Either<Failure, String>> getProfilPic(String username) async {
    try {
      final result = await mediaRemoteDataSource.getProfilPic(username);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        Failure(message: failure.message),
      );
    }
  }
}
