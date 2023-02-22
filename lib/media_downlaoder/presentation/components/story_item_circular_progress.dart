import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_dp/core/utils/app_constances.dart';
import 'package:insta_dp/media_downlaoder/presentation/controller/story_item_bloc/story_item_bloc.dart';

class StoryItemCircularProgress extends StatefulWidget {
  const StoryItemCircularProgress({
    Key? key,
  }) : super(key: key);

  @override
  State<StoryItemCircularProgress> createState() =>
      _StoryItemCircularProgressState();
}

class _StoryItemCircularProgressState extends State<StoryItemCircularProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: AppConstances.waitingDuration,
      ),
    );

    // controller.addListener(() {
    //   print(controller.value);
    // });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoryItemBloc, StoryItemState>(
      listenWhen: (previous, current) =>
          current is CounterWaitingState || previous is CounterWaitingState,
      listener: (context, state) {
        print(state);
        if (state is CounterWaitingState) {
          print('forward');
          controller.forward();
        } else {
          print('reverse');
          controller.reverse();
        }
      },
      builder: (context, state) {
        print('state $state');
        return SizedBox(
          height: 50,
          width: 50,
          child: (state is CounterWaitingState)
              ? AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: CircularProgressIndicator(
                            value: 1 - controller.value,
                          ),
                        ),
                        Text(
                          '${state.seconds}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    );
                  })
              : null,
        );
      },
    );
  }
}
