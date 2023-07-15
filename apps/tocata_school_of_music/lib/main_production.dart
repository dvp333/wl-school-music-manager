import 'package:tocata_school_of_music/app/app.dart';
import 'package:tocata_school_of_music/app/environment/enviroments.dart';
import 'package:tocata_school_of_music/bootstrap.dart';

void main() {
  bootstrap(
    env: Environments.prod,
    builder: () => const App(),
  );
}
