// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:insta_dp/core/error/failure.dart';
import 'package:insta_dp/media_downlaoder/domain/repository/base_media_repository.dart';

class GetProfilPicUseCase {
  final BaseMediaRepository mediaRepository;

  GetProfilPicUseCase(
    this.mediaRepository,
  );

  Future<Either<Failure, String>> execute(String idUser) async {
    return await mediaRepository.getProfilPic(idUser);
  }
}
