import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_dp/core/utils/app_constances.dart';
import 'package:insta_dp/media_downlaoder/presentation/controller/media_bloc/media_bloc.dart';

class MediaCircularProgress extends StatefulWidget {
  const MediaCircularProgress({
    Key? key,
  }) : super(key: key);

  @override
  State<MediaCircularProgress> createState() => _MediaCircularProgressState();
}

class _MediaCircularProgressState extends State<MediaCircularProgress>
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
    return BlocConsumer<MediaBloc, MediaState>(
      listenWhen: (previous, current) =>
          current is CounterWaitingState || previous is CounterWaitingState,
      listener: (context, state) {
        if (state is CounterWaitingState) {
          controller.forward();
        } else {
          controller.reverse();
        }
      },
      builder: (context, state) {
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
