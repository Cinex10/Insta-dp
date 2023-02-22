import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_dp/core/models/faq.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/content_section.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/custom_app_bar.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/custom_bottom_app_bar.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/media_circular_progress.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/custom_button.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/custom_expansion_tile.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/media_box.dart';
import 'package:insta_dp/media_downlaoder/presentation/controller/media_bloc/media_bloc.dart';

class ProfilPicLinkScreen extends StatelessWidget {
  const ProfilPicLinkScreen({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.faqs,
    required this.contentLength,
    required this.dataPath,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final int contentLength;
  final String dataPath;

  final List<FAQ> faqs;

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Instagram profile picture downloader',
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
                      title.tr(),
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
                      subtitle.tr(),
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
                  //LINK FIELD
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: (1.sw > 700) ? 0.1.sw : 0.0.sw,
                    ),
                    child: ProfilePicLinkField(),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  //WAITING INDICATOR
                  const MediaCircularProgress(),
                  const SizedBox(
                    height: 30,
                  ),
                  //SITE PRESENTATION
                  ContentSection(
                    dataPath: dataPath,
                    contentLength: contentLength,
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
          )),
    );
  }
}

class ProfilePicLinkField extends StatelessWidget {
  ProfilePicLinkField({
    Key? key,
  }) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MediaBloc, MediaState>(
      listenWhen: (previous, current) => (current is VideoLoadedState),
      listener: (context, state) {
        if (state is VideoLoadedState) {
          showDialog(
            context: context,
            barrierColor: const Color.fromARGB(225, 0, 0, 0),
            builder: (_) => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(
                  vertical: 100.h, horizontal: (1.sw > 1000) ? 450.w : 0.15.sw),
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 10,
                          child: Text(
                            'Download is about to start',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: (1.sw > 1000) ? 30 : 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Material(
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.close),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                          width: 300,
                          // height: 300,
                          child: MediaBox(
                              isVideo: state.media.isVideo,
                              thumbnail: state.media.thumbnail,
                              url: state.media.url)),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: CustomButton(
                      shadowColor: Colors.blue,
                      onPressed: () {
                        context.read<MediaBloc>().add(
                              PreviewMediaEvent(
                                url: state.media.url,
                              ),
                            );
                      },
                      label: 'download-btn-label'.tr(),
                      leading: Icons.download_rounded,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Container(
              width: 1.sw,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 22, 146, 213),
                    Color(0xFF41DEAC),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0,
                    1,
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: (1.sw > 576) ? 40 : 20,
                vertical: 80,
              ),
              child: Center(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ThemeData().colorScheme.copyWith(
                          secondary: Colors.black,
                          primary: Colors.black,
                        ),
                  ),
                  child: TextField(
                    controller: controller,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      errorText: (state is ErrorState) ? state.message : null,
                      isDense: true,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(2),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 49, 164, 226),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          onPressed: () async {
                            var e = await Clipboard.getData('text/plain');
                            if (e != null) {
                              controller.text = e.text ?? '';
                              controller.selection = TextSelection.fromPosition(
                                TextPosition(
                                  offset: controller.text.length,
                                ),
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.paste,
                          ),
                          label: const Text(
                            'Paste',
                          ),
                        ),
                      ),
                      prefixIconColor: Colors.amber,
                      focusColor: Colors.red,
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'profile-pic-hint'.tr(),
                      prefixIcon: const Icon(
                        Icons.play_circle_outline_rounded,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              shadowColor: Colors.blue,
              onPressed: () {
                if ((state is! LoadingVideoState) ||
                    (state is! CounterWaitingState)) {
                  context.read<MediaBloc>().add(
                        LoadProfilPicEvent(
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
              label: 'get-btn-label'.tr(),
            ),
          ],
        );
      },
    );
  }
}
