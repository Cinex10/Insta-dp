import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_dp/core/services/service_locator.dart';
import 'package:insta_dp/core/utils/routes.dart';
import 'package:insta_dp/i18n/codegen_loader.g.dart';
import 'package:insta_dp/media_downlaoder/presentation/controller/media_bloc/media_bloc.dart';
import 'package:insta_dp/media_downlaoder/presentation/controller/story_item_bloc/story_item_bloc.dart';

Future<void> main() async {
  ServiceLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('de'),
        Locale('en'),
        Locale('es'),
        Locale('fr'),
        Locale('id'),
        Locale('it'),
        Locale('pl'),
        Locale('tr'),
      ],
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      path: 'lib/i18n',
      assetLoader: const CodegenLoader(),
      child: ScreenUtilInit(
        designSize: const Size(1920, 1080),
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<MediaBloc>(),
              ),
              BlocProvider(
                create: (context) => sl<StoryItemBloc>(),
              ),
            ],
            child: MaterialApp(
              routes: Routes.routes,
              initialRoute: '/',
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,

              // routeInformationParser: const QRouteInformationParser(),
              // routerDelegate: QRouterDelegate(
              //   Routes.routes,
              //   initPath: '/',
              // ),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: GoogleFonts.montserratTextTheme().copyWith(
                  bodyText1: GoogleFonts.montserrat(),
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
