import 'package:dartz/dartz.dart';
import 'package:insta_dp/core/error/failure.dart';
import 'package:insta_dp/media_downlaoder/data/models/media_model.dart';
import 'package:insta_dp/media_downlaoder/domain/repository/base_media_repository.dart';

class GetMediaUseCase {
  final BaseMediaRepository mediaRepository;

  GetMediaUseCase(this.mediaRepository);

  Future<Either<Failure, MediaModel>> execute(String shortcode) async {
    return await mediaRepository.getVideo(shortcode);
  }
}
