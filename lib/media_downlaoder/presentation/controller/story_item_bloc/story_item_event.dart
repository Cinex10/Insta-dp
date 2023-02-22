// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'story_item_bloc.dart';

abstract class StoryItemEvent extends Equatable {
  const StoryItemEvent();

  @override
  List<Object> props() => [];
}

class LoadStoryItemsEvent extends StoryItemEvent {
  final String url;

  const LoadStoryItemsEvent({
    required this.url,
  });
}

class LoadHighlightEvent extends StoryItemEvent {
  final String url;

  const LoadHighlightEvent({
    required this.url,
  });
}

class WaitDownlaodStoryItemEvent extends StoryItemEvent {
  final List<StoryItemModel> storyItems;
  const WaitDownlaodStoryItemEvent({
    required this.storyItems,
  });
}

class PreviewStoryItemEvent extends StoryItemEvent {
  final String url;

  const PreviewStoryItemEvent({
    required this.url,
  });
}
