// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/custom_button.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/media_box.dart';

import 'package:insta_dp/media_downlaoder/presentation/controller/media_bloc/media_bloc.dart';

class MediaLinkField extends StatelessWidget {
  MediaLinkField({
    Key? key,
    required this.hint,
  }) : super(key: key);

  final TextEditingController controller = TextEditingController();
  final String hint;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MediaBloc, MediaState>(
      listenWhen: (previous, current) => (current is VideoLoadedState)
      // || (current is CounterWaitingState)
      ,
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
                  CustomButton(
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
                ],
              ),
            ),
          );
        }
        // if (state is CounterWaitingState) {
        //   if (state.seconds == AppConstances.waitingDuration) {
        //     precacheImage(NetworkImage(state.url), context);
        //   }
        // }

        // rootBundle.la
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
                      hintText: hint,
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
              label: 'get-btn-label'.tr(),
            )
          ],
        );
      },
    );
  }
}
