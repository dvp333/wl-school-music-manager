import 'package:flutter/material.dart';
import 'package:fretz/core/design_system/components/gradient_button.dart';
import 'package:fretz/core/design_system/fretz_colors.dart';
import 'package:fretz/core/design_system/images/fretz_images.dart';
import 'package:fretz/features/level_selection/view/level_selection_page.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: MainMenuPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FretzColors.mainMenuBackground,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 61),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(FretzImages.logo),
                  height: 100,
                ),
                Text(
                  'retz',
                  style: TextStyle(
                    fontSize: 60,
                    // color: Colors.amber.shade600,
                  ),
                ),
                // GradientText(
                //   'retz',
                //   style: const TextStyle(
                //     fontSize: 70,
                //     shadows: [
                //       Shadow(
                //         color: FretzColors.yellowGradient,
                //         blurRadius: 1,
                //         offset: Offset(0.5, 0.5),
                //       ),
                //     ],
                //   ),
                //   colors: const [
                //     FretzColors.redGradient,
                //     FretzColors.yellowGradient,
                //   ],
                // ),
              ],
            ),
            // const Text(
            //   'Fretz',
            //   style: TextStyle(
            //     fontSize: 40,
            //     // color: FretzColors.yellowGradient,
            //   ),
            // ),
            const Image(image: AssetImage(FretzImages.mainMenuBackgorund)),
            const SizedBox(height: 10),
            _playButton(context),
            const SizedBox(height: 15),
            _settingsButtons(),
          ],
        ),
      ),
    );
  }

  Widget _playButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GradientButton(
        onPressed: () {
          Navigator.of(context).push(LevelSelecetionPage.route());
        },
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
