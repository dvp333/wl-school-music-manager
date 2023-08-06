import 'package:fretz/app/app.dart';
import 'package:fretz/app/environment/enviroments.dart';
import 'package:fretz/bootstrap.dart';

void main() {
  bootstrap(
    builder: () => const App(),
    env: Environments.stg,
  );
}
