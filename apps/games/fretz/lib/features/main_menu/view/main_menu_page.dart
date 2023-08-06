import 'package:flutter/material.dart';
import 'package:fretz/core/design_system/components/gradient_button.dart';
import 'package:fretz/core/design_system/images/fretz_images.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: MainMenuPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191415),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 61),
            const Text('Fretz', style: TextStyle(fontSize: 70)),
            const Image(image: AssetImage(FretzImages.mainMenuBackgorund)),
            const SizedBox(height: 10),
            _playButton(),
            const SizedBox(height: 15),
            _settingsButtons(),
          ],
        ),
      ),
    );
  }

  Widget _playButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GradientButton(
        onPressed: () {},
        child: const Text(
          'Play',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget _settingsButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GradientButton(
        onPressed: () {},
        child: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
