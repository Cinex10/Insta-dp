import 'package:easy_localization/easy_localization.dart';
import 'package:insta_dp/core/models/faq.dart';
import 'package:insta_dp/media_downlaoder/presentation/ui/media_ui/media_link_screen.dart';
import 'package:insta_dp/media_downlaoder/presentation/ui/media_ui/profile_pic_link_screen.dart';
import 'package:insta_dp/media_downlaoder/presentation/ui/story_item_ui/highlight_link_screen.dart';
import 'package:insta_dp/media_downlaoder/presentation/ui/story_item_ui/story_item_link_screen.dart';
import 'package:insta_dp/ui/contact_screen.dart';
import 'package:insta_dp/ui/home_screen.dart';
import 'package:insta_dp/ui/policy_screen.dart';
import 'package:insta_dp/ui/terms_screen.dart';

class Routes {
  static String homeScreen = '/';
  static String reelScreen = '/instagram-reels-downloader';
  static String storyScreen = '/instagram-story-downloader';
  static String profilPicScreen = '/instagram-profile-picture-downloader';
  static String highlightScreen = '/instagram-highlight-downloader';
  static String videoScreen = '/instagram-video-downloader';
  static String photoScreen = '/instagram-pictures-downloader';
  static String termsScreen = '/terms';
  static String policyScreen = '/policy';
  static String contactScreen = '/contact';

  static final routes = {
    homeScreen: (context) => HomeScreen(),
    termsScreen: (context) => TermsScreen(),
    contactScreen: (context) => ContactScreen(),
    policyScreen: (context) => PolicyScreen(),
    reelScreen: (context) => MediaLinkScreen(
          contentLength: 1,
          title: 'reels-title'.tr(),
          dataPath: 'reel',
          subtitle: 'reels-subtitle'.tr(),
          hint: "reels-hint".tr(),
          pageTitle: 'Instagram Reels Downloader',
          faqs: List.generate(
            6,
            (index) => FAQ(
              question: 'reel-q$index'.tr(),
              answer: {
                'text1': 'reel-a$index'.tr(),
              },
            ),
          ),
        ),
    videoScreen: (context) => MediaLinkScreen(
          contentLength: 1,
          title: 'video-title'.tr(),
          subtitle: 'video-subtitle'.tr(),
          hint: 'video-hint'.tr(),
          dataPath: 'video',
          pageTitle: 'instagram video downloader',
          faqs: List.generate(
            5,
            (index) => FAQ(
              question: 'video-q$index'.tr(),
              answer: {
                'text1': 'video-a$index'.tr(),
              },
            ),
          ),
        ),
    profilPicScreen: (context) => ProfilPicLinkScreen(
          contentLength: 1,
          title: 'profile-pic-title'.tr(),
          subtitle: 'profile-pic-subtitle'.tr(),
          dataPath: 'profile-pic',
          faqs: List.generate(
            4,
            (index) => FAQ(
              question: 'profile-pic-q$index'.tr(),
              answer: {
                'text1': 'profile-pic-a$index'.tr(),
              },
            ),
          ),
        ),
    photoScreen: (context) => MediaLinkScreen(
          contentLength: 1,
          title: 'picture-title'.tr(),
          subtitle: 'picture-subtitle'.tr(),
          hint: 'picture-hint'.tr(),
          dataPath: 'photo',
          pageTitle: 'download pictures instagram',
          faqs: List.generate(
            4,
            (index) => FAQ(
              question: 'photo-q$index'.tr(),
              answer: {
                'text1': 'photo-a$index'.tr(),
              },
            ),
          ),
        ),
    storyScreen: (context) => StoryItemLinkScreen(
          contentLength: 1,
          title: 'story-title'.tr(),
          subtitle: 'story-subtitle'.tr(),
          dataPath: 'story',
          faqs: List.generate(
            6,
            (index) => FAQ(
              question: 'story-q$index'.tr(),
              answer: {
                'text1': 'story-a$index'.tr(),
              },
            ),
          ),
        ),
    highlightScreen: (context) => HighlightLinkScreen(
          contentLength: 1,
          title: 'highlight-title'.tr(),
          dataPath: 'highlight',
          subtitle: 'highlight-title'.tr(),
          faqs: List.generate(
            5,
            (index) => FAQ(
              question: 'highlight-q$index'.tr(),
              answer: {
                'text1': 'highlight-a$index'.tr(),
              },
            ),
          ),
        ),
  };
}
