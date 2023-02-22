// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'media_bloc.dart';

abstract class MediaEvent extends Equatable {
  const MediaEvent();
  @override
  List<Object?> props() => [];
}

class LoadVideoEvent extends MediaEvent {
  final String url;
  const LoadVideoEvent({
    required this.url,
  });

  @override
  List<Object?> props() => [url];
}

class LoadProfilPicEvent extends MediaEvent {
  final String url;
  const LoadProfilPicEvent({
    required this.url,
  });

  @override
  List<Object?> props() => [url];
}

class WaitDownlaodVideoEvent extends MediaEvent {
  final MediaModel media;

  const WaitDownlaodVideoEvent({
    required this.media,
  });
  @override
  List<Object?> props() => [
        media,
      ];
}

class PreviewMediaEvent extends MediaEvent {
  final String url;
  const PreviewMediaEvent({
    required this.url,
  });
  @override
  List<Object?> props() => [
        url,
      ];
}
