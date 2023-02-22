import 'package:dartz/dartz.dart';
import 'package:insta_dp/core/error/failure.dart';
import 'package:insta_dp/media_downlaoder/data/models/media_model.dart';

abstract class BaseMediaRepository {
  Future<Either<Failure, MediaModel>> getVideo(String shortcode);

  Future<Either<Failure, String>> getProfilPic(String username);
}
