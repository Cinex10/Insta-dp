import 'package:dio/dio.dart';
import 'package:insta_dp/core/error/exception.dart';
import 'package:insta_dp/core/utils/app_constances.dart';
import 'package:insta_dp/media_downlaoder/data/models/story_item_model.dart';

abstract class BaseStoryItemRemoteDataSource {
  Future<List<StoryItemModel>> getStories(String idUser);
  Future<List<StoryItemModel>> getHighlight(String idHighlight);

  Future<String> getUserId(String username);
}

class StoryItemRemoteDataSource extends BaseStoryItemRemoteDataSource {
  @override
  Future<List<StoryItemModel>> getStories(String idUser) async {
    var response = await Dio().get(
      '${AppConstances.getStoryUrl}/?id_user=$idUser',
      options: Options(
        headers: {
          'X-RapidAPI-Key': AppConstances.rapidapiKey,
          'X-RapidAPI-Host': AppConstances.rapidapiHost,
        },
      ),
    );

    print('response.data');
    if ((response.statusCode == 200) &&
        (response.data['reels'] != null) &&
        (response.data['reels'] is! List)) {
      print('response.data2');
      return StoryItemModel.listFromJson(
          response.data['reels'][idUser]['items'] as List<dynamic>);
    } else {
      if (response.data['message'] != null) {
        throw ServerException(message: response.data['message']);
      } else {
        throw ServerException(message: 'failed to download');
      }
    }
  }

  @override
  Future<String> getUserId(String username) async {
    final response = await Dio().get(
      '${AppConstances.getUserIdUrl}/?user=$username',
      options: Options(
        headers: {
          'X-RapidAPI-Key': AppConstances.rapidapiKey,
          'X-RapidAPI-Host': AppConstances.rapidapiHost,
        },
      ),
    );

    if ((response.statusCode == 200) && (response.data['id'] != null)) {
      return response.data['id'].toString();
    } else {
      print('object');
      throw ServerException(message: 'invalid username');
    }
  }

  @override
  Future<List<StoryItemModel>> getHighlight(String idHighlight) async {
    var response = await Dio().get(
      '${AppConstances.getHighlightUrl}/?id_highlight=$idHighlight',
      options: Options(
        headers: {
          'X-RapidAPI-Key': AppConstances.rapidapiKey,
          'X-RapidAPI-Host': AppConstances.rapidapiHost,
        },
      ),
    );

    if ((response.statusCode == 200) &&
        (response.data['reels']['highlight:$idHighlight'] != null)) {
      return StoryItemModel.listFromJson(response.data['reels']
          ['highlight:$idHighlight']['items'] as List<dynamic>);
    } else {
      if (response.data['message'] != null) {
        throw ServerException(message: response.data['message']);
      } else {
        throw ServerException(message: 'failed to download');
      }
    }
  }
}
