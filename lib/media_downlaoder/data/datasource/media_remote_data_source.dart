import 'package:dio/dio.dart';
import 'package:insta_dp/core/error/exception.dart';
import 'package:insta_dp/core/utils/app_constances.dart';
import 'package:insta_dp/media_downlaoder/data/models/media_model.dart';

abstract class BaseMediaRemoteDataSource {
  Future<MediaModel> getVideo(String shortcode);

  Future<String> getProfilPic(String username);
}

class MediaRemoteDataSource extends BaseMediaRemoteDataSource {
  @override
  Future<MediaModel> getVideo(String shortcode) async {
    var response = await Dio().get(
      '${AppConstances.getMediaUrl}/?shortcode=$shortcode',
      // queryParameters: {
      //   'shortcode': shortcode,
      // },
      options: Options(
        headers: {
          'X-RapidAPI-Key': AppConstances.rapidapiKey,
          'X-RapidAPI-Host': AppConstances.rapidapiHost,
        },
      ),
    );

    if ((response.statusCode == 200) && (response.data['id'] != null)) {
      return MediaModel.fromJson(response.data);
    } else {
      if (response.data['message'] != null) {
        throw ServerException(message: response.data['message']);
      } else {
        throw ServerException(message: 'failed to download');
      }
    }
  }

  @override
  Future<String> getProfilPic(String username) async {
    final response = await Dio().get(
      '${AppConstances.getUserIinfoUrl}/?user=$username',
      options: Options(
        headers: {
          'X-RapidAPI-Key': AppConstances.rapidapiKey,
          'X-RapidAPI-Host': AppConstances.rapidapiHost,
        },
      ),
    );
    if ((response.statusCode == 200) &&
        (response.data['data']['user'] != null)) {
      return response.data['data']['user']['profile_pic_url_hd'];
    } else {
      if (response.data['message'] != null) {
        throw ServerException(message: response.data['message']);
      } else {
        throw ServerException(message: 'failed to download');
      }
    }
  }
}
