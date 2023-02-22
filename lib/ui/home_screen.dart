import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/content_section.dart';
import 'package:insta_dp/core/models/faq.dart';
import 'package:insta_dp/core/utils/routes.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/custom_app_bar.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/custom_bottom_app_bar.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/custom_expansion_tile.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/feature_box.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  // final List<FAQ> faqs = [
  //   FAQ(
  //     question: 'What are instadp tools?',
  //     answer: {
  //       'text':
  //           '<bold>instadp tools</bold> allows you to download video from instagram in HD and  FULL HD quality, as well as reels and stories. instadp tools are available and free for everyone, you only have to enter the site every time you want,and you will be able to find the download video tools easily.',
  //     },
  //   ),
  //   FAQ(
  //     question: "What can instadp tools do?",
  //     answer: {
  //       "text":
  //           "<bold>instadp tools</bold> gives you several options to download video from instagram, including:\n       • Download insta videos in high quality, such as HD and fullHD.\n       • instagram photo downloader.\n       • Download video from instagram without sound (silent video).\n       • Instagram Reels downloader: Here in <bold>instadp tools</bold> ,you can watch this short video and download directly.\n       • Download online instagram video from stores.\n       • Video download from instagram highlights.\n       • instagram profile picture downloader.",
  //     },
  //   ),
  //   FAQ(
  //     question:
  //         "Do I need to download and install any software to use instadp tools?",
  //     answer: {
  //       "text":
  //           "You don't need any app for <bold>instadp tools</bold> to work, you should just go to the site and enjoy super fast video instagram downloading.",
  //     },
  //   ),
  //   FAQ(
  //     question: "Are instadp tools paid or free?",
  //     answer: {
  //       "text":
  //           "You can use all the services of <bold>instadp tools</bold>  for free, and if you have any deal or sponsorship contact us on email: instadptools@gmail.com.",
  //     },
  //   ),
  //   FAQ(
  //     question: "Do instadp tools need a VPN to download videos?",
  //     answer: {
  //       "text":
  //           "<bold>instadp tools</bold> doesn't need any VPN to download videos from instagram, maybe in restricted areas of some google services you may need VPN to work property.",
  //     },
  //   ),
  //   FAQ(
  //     question: "Can I use instadp tools on mobile or PC?",
  //     answer: {
  //       "text":
  //           "You can use <bold>instadp tools</bold> on mobile, PC, and any tablet with the same interface download quality.",
  //     },
  //   ),
  //   FAQ(
  //     question: "Instadp tools support Android or iOS devices?",
  //     answer: {
  //       "text":
  //           "<bold>instadp tools</bold> supports Android and iOS devices, instagram video download procedure is not different between them, you can apply the same steps to download directly.",
  //     },
  //   ),
  // ];

  final int nbQst = 7;

  final List<FAQ> faqs = List.generate(
    7,
    (index) => FAQ(
      question: 'home-q$index'.tr(),
      answer: {
        'text1': 'home-a$index'.tr(),
      },
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Instadp tools',
      color: Colors.black,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: CustomAppBar(),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 20,
              right: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //TITLE
                FittedBox(
                  child: Text(
                    'home-title'.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      // height: 1.23,
                      color: Colors.black,
                      fontSize: (1.sw > 1000)
                          ? 80.r
                          : (1.sw > 700)
                              ? 120.r
                              : 130.r,

                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),

                //SUBTITLE
                FittedBox(
                  child: Text(
                    'home-subtitle'.tr(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      height: 2,
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                //WRAP
                SizedBox(
                  width: (1.sw > 1000)
                      ? 0.7.sw
                      : (1.sw > 700)
                          ? 0.9.sw
                          : 0.91.sw,

                  // padding: EdgeInsets.symmetric(
                  //   // horizontal: (1.sw > 576) ? 0.15.sw : 0.04.sw,
                  //   horizontal: (1.sw > 576) ? 0.sw : 0.sw,
                  // ),
                  child: Wrap(
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    children: [
                      FeatureBox(
                        icon: 'reels.svg',
                        label: 'reels-label'.tr(),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.reelScreen);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => MediaLinkScreen(
                          //       title: 'Download Reels',
                          //       subtitle:
                          //           'Download any instagram reel by typing the link.',
                          //       hint: 'Entre a reel link',
                          //       faqs: [
                          //         FAQ(
                          //             question:
                          //                 "What is Instagram reels downloader?",
                          //             answer: {
                          //               'text':
                          //                   "Here in instadp tools allows you to download Instagram reels from any account of your friends, idols, full quality, and without any restrictions.",
                          //             }),
                          //         FAQ(
                          //             question:
                          //                 "How to download reels from Instagram?",
                          //             answer: {
                          //               'text':
                          //                   "With simple steps, you can use instadp tools to download a reels and for the upload process to be successful, follow the following steps in order:\n       • visit our website: <bold>www.instadptools.com.</bold>.\n       • At the top of the main page you will find several options for downloading media from instadp tools.\n       • Click on the option to download reels .\n       • When the page opens, put the link of the reels in the box.\n       • Click on the <bold>“Get”</bold>.\n       • After 30 second, a <bold>“Download”</bold> button will appear, click on it.",
                          //             }),
                          //         FAQ(
                          //             question:
                          //                 "Does instadp tools have all reel video formats?",
                          //             answer: {
                          //               'text':
                          //                   "Yes, instadp tools can download all instagram reels in high quality, and from all accounts, whether commercial pages or famous channels.",
                          //             }),
                          //         FAQ(
                          //             question:
                          //                 "Do instadp tools download the reels video from instagram in full size?",
                          //             answer: {
                          //               'text':
                          //                   "instadp tools downloading reels from instagram with full size and accuracy, and in Hd and full Hd quality.",
                          //             }),
                          //         FAQ(
                          //             question:
                          //                 "Can instadp tools download reels without sound? ",
                          //             answer: {
                          //               'text':
                          //                   "instadp tools allows you to download reels without  or with sounds.",
                          //             }),
                          //         FAQ(
                          //           question:
                          //               "Does instadp tools have download reels if it has restrictions?",
                          //           answer: {
                          //             'text':
                          //                 "Instadp tools allows users to download all reels of Instagram without any restrictions.",
                          //           },
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                      FeatureBox(
                        icon: 'photo.svg',
                        label: 'picture-label'.tr(),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.photoScreen);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => MediaLinkScreen(
                          //       title: 'Download Photo',
                          //       subtitle:
                          //           'Download any instagram photo by typing the link.',
                          //       hint: 'Enter a post link',
                          //       faqs: [
                          //         FAQ(
                          //           question:
                          //               "What is an Instagram photos downloader?",
                          //           answer: {
                          //             "text":
                          //                 "With instadp tools you can download all instagram photos from any account of your friends, idols, full quality, and without any restrictions.",
                          //           },
                          //         ),
                          //         FAQ(
                          //           question:
                          //               "How to download photos from Instagram?",
                          //           answer: {
                          //             'text':
                          //                 "With simple steps, you can use instadp tools to download a photos  and for the upload process to be successful, follow the following steps in order:\n       • visit our website: <bold>www.instadptools.com.</bold>.\n       • At the top of the main page you will find several options for downloading media from instadp tools.\n       • Click on the option to download photos.\n       • When the page opens, put the link of the photos in the box.\n       • Click on the <bold>“Get”</bold>.\n       • After 30 second, a <bold>“Download”</bold> button will appear, click on it.",
                          //           },
                          //         ),
                          //         FAQ(
                          //           question:
                          //               "Does instadp tools have all image formats?",
                          //           answer: {
                          //             "text":
                          //                 "Yes, instadp tools can download all instagram photos in high quality, and from all accounts, whether commercial pages or famous channels.",
                          //           },
                          //         ),
                          //         FAQ(
                          //           question:
                          //               "Do instadp tools download the image from instagram in full size?",
                          //           answer: {
                          //             "text":
                          //                 "instadp tools downloading photos from instagram with full size and accuracy.",
                          //           },
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                      FeatureBox(
                        icon: 'highlight.svg',
                        label: 'highlight-label'.tr(),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.highlightScreen);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => HighlightLinkScreen(
                          //       title: 'Download Highlight',
                          //       subtitle:
                          //           'Download any instagram highlight by typing the link.',
                          //       faqs: [
                          //         FAQ(
                          //           question:
                          //               "What Instagram stories highlight downloaders?",
                          //           answer: {
                          //             "text":
                          //                 "instadp tools provides you to download Instagram stories highlights from any account of your friends, idols, full quality, and without any restrictions, and in simple staples.",
                          //           },
                          //         ),
                          //         FAQ(
                          //           question:
                          //               "How to download story highlight from Instagram?",
                          //           answer: {
                          //             'text':
                          //                 "With simple steps, you can use instadp tools to download a story highlights and for the upload process to be successful, follow the following steps in order:\n       • visit our website: <bold>www.instadptools.com.</bold>.\n       • At the top of the main page you will find several options for downloading media from instadp tools.\n       • Click on the option story highlight.\n       • When the page opens, put the link of the story highlight in the box.\n       • Click on the <bold>“Get”</bold>.\n       • After 30 second, a <bold>“Download”</bold> button will appear, click on it.",
                          //           },
                          //         ),
                          //         FAQ(
                          //           question:
                          //               "Do instadp tools have all stories highlighted formats?",
                          //           answer: {
                          //             "text":
                          //                 "Yes, instadp tools can download all instagram stories highlighted in high quality, and from all accounts, whether commercial pages or famous channels.",
                          //           },
                          //         ),
                          //         FAQ(
                          //           question:
                          //               "Do instadp tools download the story highlight from instagram in full size?",
                          //           answer: {
                          //             "text":
                          //                 "instadp tools downloading story highlights from instagram with full size and accuracy, and in Hd and full Hd quality.",
                          //           },
                          //         ),
                          //         FAQ(
                          //           question:
                          //               "Can instadp tools download the story highlight without sound? ",
                          //           answer: {
                          //             "text":
                          //                 "instadp tools allows you to download stories highlights without or with sounds.",
                          //           },
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                      FeatureBox(
                        icon: 'story.svg',
                        label: 'story-label'.tr(),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.storyScreen);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => StoryItemLinkScreen(
                          //       title: 'Download Stories',
                          //       subtitle:
                          //           'Download any instagram story by typing the link.',
                          //       faqs: [
                          //         FAQ(
                          //           question:
                          //               "What is an Instagram story downloader?",
                          //           answer: {
                          //             "text":
                          //                 "In instadp tools, you can download Instagram stories from any account of your friends, idols, full quality, and without any restrictions, whether it's a picture, a Gif, or a video.",
                          //           },
                          //         ),
                          //         FAQ(
                          //           question:
                          //               "How to download story from Instagram?",
                          //           answer: {
                          //             'text':
                          //                 "With simple steps, you can use instadp tools to download a story and for the upload process to be successful, follow the following steps in order:\n       • visit our website: <bold>www.instadptools.com.</bold>.\n       • At the top of the main page you will find several options for downloading media from instadp tools.\n       • Click on the option story.\n       • When the page opens, put the link of the story in the box.\n       • Click on the <bold>“Get”</bold>.\n       • After 30 second, a <bold>“Download”</bold> button will appear, click on it.",
                          //           },
                          //         ),
                          //         FAQ(
                          //           question:
                          //               "Do instadp tools have all stories formats?",
                          //           answer: {
                          //             "text":
                          //                 "Yes, instadp tools can download all instagram stories in high quality, and from all accounts, whether commercial pages or famous channels.",
                          //           },
                          //         ),
                          //         FAQ(
                          //           question:
                          //               "Do instadp tools download the story from instagram in full size?",
                          //           answer: {
                          //             "text":
                          //                 "instadp tools downloading stories from instagram with full size and accuracy, and in Hd and full Hd quality.",
                          //           },
                          //         ),
                          //         FAQ(
                          //           question:
                          //               "Can instadp tools download the story without sound? ",
                          //           answer: {
                          //             "text":
                          //                 "instadp tools allows you to download stories without or with sounds.",
                          //           },
                          //         ),
                          //         FAQ(
                          //           question:
                          //               "Instagram stories downloader in instadp tools free of charge?",
                          //           answer: {
                          //             "text":
                          //                 "Yes, all the services here in instadp tools are 100% free.",
                          //           },
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                      FeatureBox(
                        icon: 'video.svg',
                        label: 'video-label'.tr(),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.videoScreen);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => MediaLinkScreen(
                          //       title: 'Download Video',
                          //       subtitle:
                          //           'Download any instagram video by typing the link.',
                          //       hint: 'Enter a video/ig tv link',
                          //       faqs: [
                          //         FAQ(
                          //           question:
                          //               "What is an Instagram video downloader?",
                          //           answer: {
                          //             "text":
                          //                 "instadp tools help you to download instagram video from any account of your friends, idols, full quality lik Hd and full Hd, and without any restrictions.",
                          //           },
                          //         ),
                          //         FAQ(
                          //           question:
                          //               "How to download video from Instagram?",
                          //           answer: {
                          //             'text':
                          //                 "With simple steps, you can use instadp tools to download a video and for the upload process to be successful, follow the following steps in order:\n       • visit our website: <bold>www.instadptools.com.</bold>.\n       • At the top of the main page you will find several options for downloading media from instadp tools.\n       • Click on the option video.\n       • When the page opens, put the link of the video in the box.\n       • Click on the <bold>“Get”</bold>.\n       • After 30 second, a <bold>“Download”</bold> button will appear, click on it.",
                          //           },
                          //         ),
                          //         FAQ(
                          //           question:
                          //               "Do instadp tools have all video formats?",
                          //           answer: {
                          //             "text":
                          //                 "Yes, instadp tools can download all instagram video in high quality, and from all accounts, whether commercial pages or famous channels",
                          //           },
                          //         ),
                          //         FAQ(
                          //           question:
                          //               "Do instadp tools download the video from instagram in full size?",
                          //           answer: {
                          //             "text":
                          //                 "instadp tools downloading video from instagram with full size and accuracy.",
                          //           },
                          //         ),
                          //         FAQ(
                          //           question: "Can I download an online video?",
                          //           answer: {
                          //             "text":
                          //                 "Here in instadp tools you can download all vio styles, whether it's a normal, online, or live video.",
                          //           },
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                      FeatureBox(
                        icon: 'profile.svg',
                        label: 'profil-pic-label'.tr(),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.profilPicScreen);

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ProfilPicLinkScreen(
                          //       title: 'Download Profile picture',
                          //       subtitle:
                          //           'Download any instagram profile picture by typing the link.',
                          //       faqs: [
                          //         FAQ(
                          //           question:
                          //               "What is an instagram photos downloader?",
                          //           answer: {
                          //             "text":
                          //                 "instagram photos downloader in instadp tools help you to download pictures from any instagram account of your friends, idols, full quality, and without any restrictions.",
                          //           },
                          //         ),
                          //         FAQ(
                          //           question:
                          //               "How to download profile pictures from Instagram?",
                          //           answer: {
                          //             'text':
                          //                 "With simple steps, you can use instadp tools to download a profile pictures and for the upload process to be successful, follow the following steps in order:\n       • visit our website: <bold>www.instadptools.com.</bold>.\n       • At the top of the main page you will find several options for downloading media from instadp tools.\n       • Click on the option profile pictures.\n       • When the page opens, put the link of the profile pictures in the box.\n       • Click on the <bold>“Get”</bold>.\n       • After 30 second, a <bold>“Download”</bold> button will appear, click on it.",
                          //           },
                          //         ),
                          //         FAQ(
                          //           question:
                          //               "Does instadp tools have all image formats?",
                          //           answer: {
                          //             "text":
                          //                 "Yes, instadp tools can download all instagram photos in high quality, and from all accounts, whether commercial pages or famous channels.",
                          //           },
                          //         ),
                          //         FAQ(
                          //           question:
                          //               "Do instadp tools download the image from instagram in full size?",
                          //           answer: {
                          //             "text":
                          //                 "instadp tools downloading profile pictures from instagram with full size and accuracy.",
                          //           },
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    enableFeedback: false,
                    foregroundColor: Colors.transparent,
                    backgroundColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  label: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                    size: 13,
                  ),
                  icon: Text(
                    "all-tools-text".tr(),
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ),
                // CustomButton(
                //   elevation: 0,
                //   backgroundColor: Colors.grey[200],
                //   labelColor: Colors.black,

                //   onPressed: () {},
                //   horizontalPadding: 5,
                //   labelFontSize: 13,
                //   verticalPadding: 3,
                //   label: "all-tools-text".tr(),
                // ),
                const SizedBox(
                  height: 60,
                ),
                //SITE PRESENTATION
                const ContentSection(
                  dataPath: 'home',
                  contentLength: 2,
                ),
                const SizedBox(
                  height: 40,
                ),
                //FAQ TITLE
                const Text(
                  'F.A.Q',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //FAQ BODY
                SizedBox(
                  width: (1.sw > 1000)
                      ? 0.9.sw
                      : (1.sw > 700)
                          ? 0.9.sw
                          : 0.91.sw,
                  // padding: EdgeInsets.symmetric(
                  //   horizontal: 0.06.sw,
                  //   vertical: 20.h,
                  // ),
                  child: Column(
                    children: List.generate(
                      faqs.length,
                      (index) => CustomExpansionTile(
                        faq: faqs[index],
                      ),
                    ),
                  ),
                ),
                //BOTTOM BAR
                const CustomBottomAppBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
