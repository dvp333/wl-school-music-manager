import 'package:flutter/material.dart';
import 'package:fretz/core/design_system/components/gradient_button.dart';
import 'package:fretz/features/ads/widgets/banner_ad_widget.dart';
import 'package:fretz/features/freatboard_mapping_levels/view/freatboard_mapping_levels_page.dart';
import 'package:fretz/l10n/l10n.dart';

class LevelSelecetionPage extends StatelessWidget {
  const LevelSelecetionPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/level_selection'),
      builder: (context) => const LevelSelecetionPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: Colors.black,
      body: BannerAdWidget(
        child: Padding(
          padding: const EdgeInsets.all(23),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 50),
                Text(
                  l10n.levelSelectionWhatAreWeGonnaPlay,
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 60),
                GradientButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(FreatboardMappingLevelsPages.route());
                  },
                  child: FittedBox(
                    child: Text(
                      l10n.levelSelectionFretboardMapping,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GradientButton(
                  // onPressed: () {},
                  child: FittedBox(
                    child: Text(
                      l10n.levelSelectionIntervals,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                // const SizedBox(height: 15),
                // const GradientButton(
                //   // onPressed: () {},
                //   child: FittedBox(
                //     child: Text(
                //       'Intervalos de quarta',
                //       style: TextStyle(fontSize: 25),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 15),
                // const GradientButton(
                //   // onPressed: () {},
                //   child: FittedBox(
                //     child: Text(
                //       'Intervalos de quinta',
                //       style: TextStyle(fontSize: 25),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 15),
                // const GradientButton(
                //   // onPressed: () {},
                //   child: FittedBox(
                //     child: Text(
                //       'Intervalos de 3 menor',
                //       style: TextStyle(fontSize: 25),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
