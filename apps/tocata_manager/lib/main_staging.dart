import 'package:tocata_manager/app/app.dart';
import 'package:tocata_manager/app/environment/enviroments.dart';
import 'package:tocata_manager/bootstrap.dart';

void main() {
  bootstrap(
    env: Environments.stg,
    builder: () => const App(),
  );
}
