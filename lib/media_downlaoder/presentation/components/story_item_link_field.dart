import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/custom_button.dart';
import 'package:insta_dp/media_downlaoder/presentation/components/media_box.dart';

import '../controller/story_item_bloc/story_item_bloc.dart';

class StoryItemLinkField extends StatelessWidget {
  StoryItemLinkField({Key? key, required this.isHighlight, required this.hint})
      : super(key: key);

  final bool isHighlight;
  final String hint;

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoryItemBloc, StoryItemState>(
      listenWhen: (previous, current) => current is LoadedStoryItemState,
      listener: (context, state) {
        if (state is LoadedStoryItemState) {
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
                      child: ListView.builder(
                        itemCount: state.storyItems.length,
                        itemBuilder: (context, index) => SizedBox(
                          height: 500,
                          width: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MediaBox(
                                isVideo: state.storyItems[index].isVideo,
                                thumbnail: state.storyItems[index].imageUrl,
                                url: ((state.storyItems[index].isVideo)
                                    ? state.storyItems[index].videoUrl
                                    : state.storyItems[index].imageUrl)!,
                              ),
                              SizedBox(
                                width: 200,
                                height: 50,
                                child: CustomButton(
                                  shadowColor: Colors.blue,
                                  onPressed: () {
                                    context.read<StoryItemBloc>().add(
                                          PreviewStoryItemEvent(
                                            url: (state
                                                    .storyItems[index].isVideo)
                                                ? state
                                                    .storyItems[index].videoUrl!
                                                : state
                                                    .storyItems[index].imageUrl,
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
                      )),
                  const Spacer(),
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
            //GET BUTTON
            CustomButton(
              shadowColor: Colors.blue,
              onPressed: () {
                if ((state is! LoadingStoryItemState) ||
                    (state is! CounterWaitingState)) {
                  if (isHighlight) {
                    context.read<StoryItemBloc>().add(
                          LoadHighlightEvent(
                            url: controller.text,
                          ),
                        );
                  } else {
                    context.read<StoryItemBloc>().add(
                          LoadStoryItemsEvent(
                            url: controller.text,
                          ),
                        );
                  }
                }
              },
              action: SizedBox(
                height: 25,
                width: 25,
                child: (state is LoadingStoryItemState)
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
