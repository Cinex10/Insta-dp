import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_dp/core/models/dimension.dart';
import 'package:insta_dp/core/services/downloader.dart';
import 'package:insta_dp/core/services/extractor.dart';
import 'package:insta_dp/core/utils/app_constances.dart';
import 'package:insta_dp/media_downlaoder/data/models/media_model.dart';
import 'package:insta_dp/media_downlaoder/domain/usecases/get_profile_pic_usecase.dart';
import 'package:insta_dp/media_downlaoder/domain/usecases/get_media_usecase.dart';

part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  final RegExp urlRegExp = RegExp(AppConstances.mediaUrlExp);
  final RegExp profileRegExp = RegExp(AppConstances.profileUrlExp);

  final GetMediaUseCase getMediaUseCase;
  final GetProfilPicUseCase getProfilPicUseCase;
  MediaBloc({
    required this.getMediaUseCase,
    required this.getProfilPicUseCase,
  }) : super(VideoInitial()) {
    on<LoadVideoEvent>((event, emit) async {
      emit(LoadingVideoState());
      if (urlRegExp.hasMatch(event.url)) {
        final String? shortcode =
            urlRegExp.allMatches(event.url).first.group(5);
        if (shortcode != null) {
          final result = await getMediaUseCase.execute(shortcode);
          await result.fold(
            //Handle errors
            (l) async => emit(
              const ErrorState("Loading error"),
            ),
            //Handle true result
            (r) async {
              add(WaitDownlaodVideoEvent(
                media: r,
              ));
            },
          );
        } else {
          emit(const ErrorState('url bad format'));
        }
      } else {
        emit(const ErrorState('url bad format'));
      }
    });
    on<WaitDownlaodVideoEvent>(
      (event, emit) async {
        // precacheImage(provider, context);

        emit(
          CounterWaitingState(
            seconds: AppConstances.waitingDuration,
            url: event.media.thumbnail,
          ),
        );
        Timer.periodic(const Duration(seconds: 1), (timer) {
          if (timer.tick == AppConstances.waitingDuration) {
            timer.cancel();
            return;
          } else {
            emit(CounterWaitingState(
              seconds: AppConstances.waitingDuration - timer.tick,
              url: event.media.thumbnail,
            ));
          }
        });

        await Future.delayed(
                const Duration(seconds: AppConstances.waitingDuration))
            .then((_) {
          emit(VideoLoadedState(media: event.media));
        });
        return;
      },
    );

    on<LoadProfilPicEvent>(
      (event, emit) async {
        print('rrrr');
        emit(LoadingVideoState());
        String username = Extractor.username(event.url);

        if (username.isNotEmpty) {
          final result = await getProfilPicUseCase.execute(username);

          await result.fold(
            //Handle errors
            (l) async => emit(
              ErrorState(l.message),
            ),
            //Handle true result
            (r) async {
              add(
                WaitDownlaodVideoEvent(
                  media: MediaModel(
                      url: r,
                      dimension: const Dimension(height: 50, width: 50),
                      text: '',
                      thumbnail: r,
                      isVideo: false,
                      ownerUsername: '',
                      ownerProfilePic: ''),
                ),
              );
              emit(SuccessState());
            },
          );
        } else {
          emit(const ErrorState('invalid information'));
        }
      },
    );

    on<PreviewMediaEvent>(
      (event, emit) async {
        await Downlaoder.download(
          event.url,
        );
        emit(SuccessState());
      },
    );
  }
}
