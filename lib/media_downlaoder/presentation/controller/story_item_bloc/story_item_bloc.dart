import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_dp/core/services/downloader.dart';
import 'package:insta_dp/core/utils/app_constances.dart';
import 'package:insta_dp/media_downlaoder/data/datasource/story_item_remote_data_source.dart';
import 'package:insta_dp/media_downlaoder/data/models/story_item_model.dart';
import 'package:insta_dp/media_downlaoder/data/repository/story_item_repository.dart';
import 'package:insta_dp/media_downlaoder/domain/repository/base_story_item_repository.dart';
import 'package:insta_dp/media_downlaoder/domain/usecases/get_highlight_use_case.dart';
import 'package:insta_dp/media_downlaoder/domain/usecases/get_stories_use_case.dart';
import 'package:insta_dp/media_downlaoder/domain/usecases/get_user_id_usecase.dart';

part 'story_item_event.dart';
part 'story_item_state.dart';

class StoryItemBloc extends Bloc<StoryItemEvent, StoryItemState> {
  final GetUserIdUseCase getUserIdUseCase;
  final GetStoriesUseCase getStoriesUseCase;
  StoryItemBloc({
    required this.getUserIdUseCase,
    required this.getStoriesUseCase,
  }) : super(const StoryItemInitial()) {
    on<LoadStoryItemsEvent>((event, emit) async {
      emit(const LoadingStoryItemState());

      String? username = RegExp(AppConstances.storieUrlExp)
          .allMatches(event.url)
          .first
          .group(3);

      print(username);

      if (username != null) {
        final result1 = await getUserIdUseCase.execute(username);

        print(result1);
        await result1.fold(
          (l) async => emit(ErrorState(message: l.message)),
          (r) async {
            final result2 = await getStoriesUseCase.execute(r);
            await result2.fold(
              (l) async => emit(ErrorState(message: l.message)),
              (r) async {
                add(WaitDownlaodStoryItemEvent(storyItems: r));
              },
            );
          },
        );

//
      } else {
        emit(const ErrorState(message: 'Invalid user name'));
      }
    });

    on<LoadHighlightEvent>((event, emit) async {
      BaseStoryItemRemoteDataSource storyItemRemoteDataSource =
          StoryItemRemoteDataSource();
      BaseStoryItemRepository storyItemRepository = StoryItemRepository(
          storyItemRemoteDataSource: storyItemRemoteDataSource);
      emit(const LoadingStoryItemState());
      // https://www.instagram.com/stories/highlights/17964930172888253/
      String? idHighlight = RegExp(AppConstances.highlightUrlExp)
          .allMatches(event.url)
          .first
          .group(7);
      // print(idHighlight);

      if (idHighlight != null) {
        final result2 =
            await GetHighlightUseCase(storyItemRepository).execute(idHighlight);
        await result2.fold(
          (l) async => emit(const ErrorState(message: 'Invalid highlight url')),
          (r) async {
            add(WaitDownlaodStoryItemEvent(storyItems: r));
            // emit(LoadedStoryItemState(storyItems: r));
          },
        );
//
      } else {
        emit(const ErrorState(message: 'Invalid user name'));
      }
    });

    on<WaitDownlaodStoryItemEvent>(
      (event, emit) async {
        emit(const CounterWaitingState(seconds: AppConstances.waitingDuration));

        Timer.periodic(const Duration(seconds: 1), (timer) {
          if (timer.tick == AppConstances.waitingDuration) {
            timer.cancel();
            // print('success ${timer.tick}');
            return;
          } else {
            print('counter ${timer.tick}');

            emit(CounterWaitingState(
                seconds: AppConstances.waitingDuration - timer.tick));
          }
        });

        await Future.delayed(
                const Duration(seconds: AppConstances.waitingDuration))
            .then((value) {
          emit(LoadedStoryItemState(storyItems: event.storyItems));
          // add(DownlaodStoryItemEvent(url: event.url, name: event.name));
        });
        return;
      },
    );

    on<PreviewStoryItemEvent>(
      (event, emit) async {
        await Downlaoder.download(event.url);
        emit(const SuccessState());
        // BaseVideoRemoteDataSource videoRemoteDataSource =
        //     VideoRemoteDataSource();
        // BaseMediaRepository storyItemRepository =
        //     MediaRepository(videoRemoteDataSource: videoRemoteDataSource);

        // final result = await DownloadVideoUseCase(storyItemRepository)
        //     .execute(event.url, event.name);

        // result.fold(
        //   (l) => emit(const ErrorState(message: 'Invalid user name')),
        //   (r) => emit(
        //     const SuccessState(),
        //   ),
        // );
      },
    );
  }
}
