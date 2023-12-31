import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fretz/app/environment/enviroments.dart';
import 'package:fretz/app/environment/environment_config.dart';
import 'package:fretz/app/injection/injector.dart';
import 'package:fretz/firebase_options.dart';
import 'package:games_services/games_services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    // TODO: call crashlytics
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    // TODO: call crashlytics
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap({
  required Environments env,
  required FutureOr<Widget> Function() builder,
}) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      log('Bootstrapping app...');

      _logFlutterErrors();
      _createBlocObserver();

      await _blockDeviceOrientationToPortrait();
      await _initEnvironmentConfig(env);
      await _initFirebase();
      await _initGetIt();
      await _signinGamesSevices();
      await _initMobileAds();

      runApp(await builder());
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

Future<void> _initMobileAds() async {
  try {
    log('Initializing Mobile Ads...');
    await MobileAds.instance.initialize();
  } catch (e) {
    if (kReleaseMode) {
      // TODO: send to Crashlytics
    } else {
      debugPrint(e.toString());
    }
  }
}

Future<void> _signinGamesSevices() async {
  try {
    log('Authenticating into Game Services...');
    final result = await GameAuth.signIn();
    print(result);
  } catch (e) {
    if (kReleaseMode) {
      // TODO: send to Crashlytics
    } else {
      debugPrint(e.toString());
    }
  }
}

Future<void> _initEnvironmentConfig(Environments env) async {
  await EnvironmentConfig.init(env);
}

void _logFlutterErrors() {
  FlutterError.onError = (details) {
    // TODO: call crashlytics
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
}

void _logUncaughtAsyncErrors() {
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter
  // framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    // TODO: call crashlytics
    // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}

void _logErrorsFromOutsideOfFlutter() {
  // To catch errors that happen outside of the Flutter context, install an
  // error listener on the current Isolate:
  Isolate.current.addErrorListener(
    RawReceivePort((pair) async {
      // TODO: call crashlytics
      // final List<dynamic> errorAndStacktrace = pair;
      // await FirebaseCrashlytics.instance.recordError(
      //   errorAndStacktrace.first,
      //   errorAndStacktrace.last,
      //   fatal: true,
      // );
    })
        .sendPort,
  );
}

void _createBlocObserver() {
  Bloc.observer = const AppBlocObserver();
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> _initGetIt() async {
  log('Initializing GetIt...');
  getIt.init(env: EnvironmentConfig.env);
  await getIt.allReady();
}

Future<void> _blockDeviceOrientationToPortrait() {
  return SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
