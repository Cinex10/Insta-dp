part of 'media_bloc.dart';

abstract class MediaState extends Equatable {
  const MediaState();

  @override
  List<Object?> props() => [];
}

class VideoInitial extends MediaState {}

class LoadingVideoState extends MediaState {}

class VideoLoadedState extends MediaState {
  final MediaModel media;

  const VideoLoadedState({
    required this.media,
  });
  @override
  List<Object?> props() => [media];
}

class CounterWaitingState extends MediaState {
  final int seconds;
  final String url;
  const CounterWaitingState({
    required this.seconds,
    required this.url,
  });
  @override
  List<Object?> props() => [seconds];
}

class SuccessState extends MediaState {}

class ReadyForDownloadingState extends MediaState {}

class ErrorState extends MediaState {
  final String message;
  const ErrorState(this.message);
  @override
  List<Object> props() => [
        message,
      ];
}
