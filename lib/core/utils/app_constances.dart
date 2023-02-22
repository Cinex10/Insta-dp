class AppConstances {
  static const String instagramScrapperBaseUrl =
      'https://instagram-scraper-2022.p.rapidapi.com/ig';
  static const String rapidapiKey =
      '4cbe001055msh2909ecef5d2ddb7p187f0cjsn8a79c7f235d6';
  static const String rapidapiHost = 'instagram-scraper-2022.p.rapidapi.com';

  static const String getMediaUrl = '$instagramScrapperBaseUrl/post_info';
  static const String getStoryUrl = '$instagramScrapperBaseUrl/stories';
  static const String getHighlightUrl = '$instagramScrapperBaseUrl/highlights';
  static const String getUserIdUrl = '$instagramScrapperBaseUrl/user_id';
  static const String getUserIinfoUrl =
      '$instagramScrapperBaseUrl/web_profile_info';

  static const String mediaUrlExp =
      r'(?:https?:\/\/)?(?:www.)?instagram.com\/?([a-zA-Z0-9\.\_\-]+)?\/([p]+)?([reel]+)?([tv]+)?\/([a-zA-Z0-9\-\_\.]+)\/?([0-9]+)?';

  static const String storieUrlExp =
      r'(?:https?:\/\/)?(?:www.)?instagram.com\/?([a-zA-Z0-9\.\_\-]+)?\/?([stories]+)?\/([a-zA-Z0-9\-\_\.]+)\/?([0-9]+)?';

  static const String highlightUrlExp =
      r'(?:https?:\/\/)?(?:www.)?instagram.com\/?([a-zA-Z0-9\.\_\-]+)?\/([p]+)?([reel]+)?([tv]+)?([stories]+)?\/([a-zA-Z0-9\-\_\.]+)\/?([0-9]+)?';
  static const String profileUrlExp =
      r'(?:https?:\/\/)?(?:www.)?instagram.com\/?([a-zA-Z0-9\.\_\-]+)?\/([a-zA-Z0-9\-\_\.]+)\/?([0-9]+)?';

  static const int waitingDuration = 5;
}
