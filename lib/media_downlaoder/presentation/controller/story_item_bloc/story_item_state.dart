// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'story_item_bloc.dart';

abstract class StoryItemState extends Equatable {
  const StoryItemState();

  @override
  List<Object> props() => [];
}

class StoryItemInitial extends StoryItemState {
  const StoryItemInitial();
}

class LoadingStoryItemState extends StoryItemState {
  const LoadingStoryItemState();
}

class LoadedStoryItemState extends StoryItemState {
  final List<StoryItemModel> storyItems;

  const LoadedStoryItemState({
    required this.storyItems,
  });
}

class CounterWaitingState extends StoryItemState {
  final int seconds;
  const CounterWaitingState({
    required this.seconds,
  });
  @override
  List<Object> props() => [seconds];
}

class SuccessState extends StoryItemState {
  const SuccessState();
}

class ReadyForDownloadingState extends StoryItemState {
  const ReadyForDownloadingState();
}

class ErrorState extends StoryItemState {
  final String message;
  const ErrorState({
    required this.message,
  });

  @override
  List<Object> props() => [message];
}
