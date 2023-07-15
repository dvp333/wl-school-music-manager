// -----------------------------------------------------------------------------
// Global ServiceLocator
// -----------------------------------------------------------------------------
import 'package:authentication/authentication.dart';
import 'package:get_it/get_it.dart';

extension AuthGetItExtension on GetIt {
  void initAuthModule() {
    GetIt getIt = GetIt.instance;
    getIt.registerSingleton(AuthenticationRepository());
  }
}
