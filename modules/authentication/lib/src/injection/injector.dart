// -----------------------------------------------------------------------------
// Global ServiceLocator
// -----------------------------------------------------------------------------
import 'package:authentication/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

extension AuthGetItExtension on GetIt {
  void initAuthModule() {
    GetIt getIt = GetIt.instance;
    getIt.registerFactoryParam((FirebaseApp? app, _) =>
        AuthenticationRepository(
            firebaseAuth:
                app == null ? null : FirebaseAuth.instanceFor(app: app),
            app: app));
  }
}
