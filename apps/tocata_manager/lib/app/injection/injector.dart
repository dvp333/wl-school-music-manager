import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tocata_manager/app/environment/enviroments.dart';
import 'package:tocata_manager/app/view/bloc/app_bloc.dart';
import 'package:tocata_manager/features/login/login.dart';
import 'package:tocata_manager/features/sign_up/sign_up.dart';

part './layers/data_layer_injector.dart';
part './layers/domain_layer_injector.dart';
part './layers/presentation_layer_injector.dart';
part 'others/async_services_injector.dart';
part 'others/others_injector.dart';

// -----------------------------------------------------------------------------
// Global ServiceLocator
// -----------------------------------------------------------------------------
/// We're allowing Reassignment so that when running tests we can override the
/// Factories with Mocked object versions.
///
/// Want to know how to use it? check https://pub.dev/packages/get_it
GetIt getIt = GetIt.instance;

extension GetItExtension on GetIt {
  void init({required Environments env}) {
    _registerSingletonsAsync();

    // Config the Layers
    _initializeDataLayer();
    _initializeDomainLayer();
    _initializePresentationLayer();

    // Config general classes
    _initializeOthers();
  }
}
