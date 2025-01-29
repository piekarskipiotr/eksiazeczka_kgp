import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eksiazeczka_kp/data/constants.dart';
import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    AppLogger.info('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    AppLogger.error('onError(${bloc.runtimeType}, $error, $stackTrace)', stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder, {bool useSentry = false}) async {
  FlutterError.onError = (details) {
    AppLogger.error(details.exceptionAsString(), details.stack);
  };

  Bloc.observer = const AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  if (useSentry) {
    await SentryFlutter.init((options) {
      options
        ..dsn = sentryDNSKey
        ..tracesSampleRate = 1.0
        ..profilesSampleRate = 1.0;
    });
  }

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/googleFonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['googleFonts'], license);
  });

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
      systemNavigationBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(await builder());
}
