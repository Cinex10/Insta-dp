import 'package:insta_dp/core/utils/app_constances.dart';

class Extractor {
  final RegExp urlRegExp = RegExp(AppConstances.mediaUrlExp);
  static String username(String profileUrl) {
    final RegExp profileRegExp = RegExp(AppConstances.profileUrlExp);
    if (profileRegExp.hasMatch(profileUrl)) {
      if (profileRegExp.allMatches(profileUrl).isNotEmpty) {
        String? username = profileRegExp.allMatches(profileUrl).first.group(2);
        if (username != null) {
          return username;
        }
      }
      return '';
    } else {
      return profileUrl;
    }
  }
}
