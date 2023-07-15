import 'package:sample_app/app/app.dart';
import 'package:sample_app/app/environment/enviroments.dart';
import 'package:sample_app/bootstrap.dart';

void main() {
  bootstrap(
    env: Environments.stg,
    builder: () => const App(),
  );
}
