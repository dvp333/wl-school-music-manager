import 'package:flutter/material.dart';
import 'package:fretz/core/design_system/components/gradient_button.dart';
import 'package:fretz/core/design_system/fretz_colors.dart';
import 'package:fretz/core/design_system/images/fretz_images.dart';
import 'package:fretz/features/ads/widgets/banner_ad_widget.dart';
import 'package:fretz/features/level_selection/view/level_selection_page.dart';
import 'package:fretz/l10n/l10n.dart';
import 'package:games_services/games_services.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: MainMenuPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FretzColors.mainMenuBackground,
      body: BannerAdWidget(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 35),
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
                    ),
                  ),
                ],
              ),
              const Image(
                image: AssetImage(FretzImages.mainMenuBackgorund),
              ),
              const Spacer(),
              _playButton(context),
              const SizedBox(height: 15),
              _leaderboardsButton(context),
            ],
          ),
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
        child: Text(
          context.l10n.mainMenuStart,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget _leaderboardsButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GradientButton(
        onPressed: _showLeaderboards,
        child: Text(
          context.l10n.mainMenuLeaderboards,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Future<void> _showLeaderboards() async {
    if (await GameAuth.isSignedIn) {
      await Leaderboards.showLeaderboards();
    } else {
      // TODO: exibir que não está logado
    }
  }
}
