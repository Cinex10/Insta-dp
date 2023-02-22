import 'package:get_it/get_it.dart';
import 'package:insta_dp/media_downlaoder/data/datasource/media_remote_data_source.dart';
import 'package:insta_dp/media_downlaoder/data/datasource/story_item_remote_data_source.dart';
import 'package:insta_dp/media_downlaoder/data/repository/media_repository.dart';
import 'package:insta_dp/media_downlaoder/data/repository/story_item_repository.dart';
import 'package:insta_dp/media_downlaoder/domain/repository/base_media_repository.dart';
import 'package:insta_dp/media_downlaoder/domain/repository/base_story_item_repository.dart';
import 'package:insta_dp/media_downlaoder/domain/usecases/get_highlight_use_case.dart';
import 'package:insta_dp/media_downlaoder/domain/usecases/get_media_usecase.dart';
import 'package:insta_dp/media_downlaoder/domain/usecases/get_profile_pic_usecase.dart';
import 'package:insta_dp/media_downlaoder/domain/usecases/get_stories_use_case.dart';
import 'package:insta_dp/media_downlaoder/domain/usecases/get_user_id_usecase.dart';
import 'package:insta_dp/media_downlaoder/presentation/controller/media_bloc/media_bloc.dart';
import 'package:insta_dp/media_downlaoder/presentation/controller/story_item_bloc/story_item_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //DATA SOURCES
    sl.registerLazySingleton<BaseStoryItemRemoteDataSource>(
        () => StoryItemRemoteDataSource());

    sl.registerLazySingleton<BaseMediaRemoteDataSource>(
        () => MediaRemoteDataSource());

    //REPOSITORY
    sl.registerLazySingleton<BaseStoryItemRepository>(
        () => StoryItemRepository(storyItemRemoteDataSource: sl()));

    sl.registerLazySingleton<BaseMediaRepository>(
        () => MediaRepository(mediaRemoteDataSource: sl()));

    //USE CASES

    sl.registerLazySingleton<GetMediaUseCase>(() => GetMediaUseCase(sl()));
    sl.registerLazySingleton<GetProfilPicUseCase>(
        () => GetProfilPicUseCase(sl()));
    sl.registerLazySingleton<GetUserIdUseCase>(() => GetUserIdUseCase(sl()));
    sl.registerLazySingleton<GetStoriesUseCase>(() => GetStoriesUseCase(sl()));
    sl.registerLazySingleton<GetHighlightUseCase>(
        () => GetHighlightUseCase(sl()));

    //BLOC
    sl.registerFactory<StoryItemBloc>(
      () => StoryItemBloc(
        getUserIdUseCase: sl(),
        getStoriesUseCase: sl(),
      ),
    );

    sl.registerFactory<MediaBloc>(
      () => MediaBloc(
        getMediaUseCase: sl(),
        getProfilPicUseCase: sl(),
      ),
    );
  }
}
