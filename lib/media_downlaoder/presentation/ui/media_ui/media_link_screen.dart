import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_dp/core/models/faq.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/content_section.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/custom_app_bar.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/custom_bottom_app_bar.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/media_circular_progress.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/custom_button.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/custom_expansion_tile.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/media_link_field.dart';
import 'package:insta_dp/media_downlaoder/presentation/controller/media_bloc/media_bloc.dart';

class MediaLinkScreen extends StatelessWidget {
  MediaLinkScreen({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.hint,
    required this.dataPath,
    required this.faqs,
    required this.contentLength,
    required this.pageTitle,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String hint;
  final String dataPath;
  final String pageTitle;
  final int contentLength;

  final List<FAQ> faqs;

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Title(
      title: pageTitle,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //TITLE
                FittedBox(
                  child: Text(
                    title,
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
                    subtitle,
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
                //LINK FIELD AND GET BUTTON
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: (1.sw > 700) ? 0.1.sw : 0.0.sw,
                  ),
                  child: MediaLinkField(hint: hint),
                ),
                const SizedBox(
                  height: 30,
                ),
                //WAITING INDICATOR
                const MediaCircularProgress(),
                const SizedBox(
                  height: 30,
                ),
                //SITE PRESENTATION
                ContentSection(
                    dataPath: dataPath, contentLength: contentLength),
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
                  height: 30,
                ),
                //FAQ BODY
                SizedBox(
                  width: (1.sw > 1000)
                      ? 0.9.sw
                      : (1.sw > 700)
                          ? 0.9.sw
                          : 0.91.sw,
                  // padding: const EdgeInsets.symmetric(
                  //   horizontal: 50,
                  //   vertical: 20,
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

class GetMediaButton extends StatelessWidget {
  const GetMediaButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaBloc, MediaState>(
      builder: (context, state) {
        return SizedBox(
          width: 200.w,
          height: 50.h,
          child: CustomButton(
            shadowColor: Colors.blue,
            onPressed: () {
              if ((state is! LoadingVideoState) ||
                  (state is! CounterWaitingState)) {
                context.read<MediaBloc>().add(
                      LoadVideoEvent(
                        url: controller.text,
                      ),
                    );
              }
            },
            action: SizedBox(
              height: 25,
              width: 25,
              child: (state is LoadingVideoState)
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    )
                  : (state is ErrorState)
                      ? const Icon(
                          Icons.close,
                          size: 25,
                        )
                      : null,
            ),
            leading: Icons.download_for_offline_sharp,
            // labelFontSize: 0,
            label: 'get-btn-label'.tr(),
          ),
        );
      },
    );
  }
}
