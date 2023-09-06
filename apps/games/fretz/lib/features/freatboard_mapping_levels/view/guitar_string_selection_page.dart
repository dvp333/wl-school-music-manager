import 'package:flutter/material.dart';
import 'package:fretz/core/design_system/components/gradient_button.dart';
import 'package:fretz/core/domain/models/guitar_strings.dart';
import 'package:fretz/features/ads/widgets/banner_ad_widget.dart';
import 'package:fretz/features/discover_the_note/presentation/view/discover_the_note_page.dart';
import 'package:fretz/l10n/l10n.dart';

class GuitarStringSelectationPage extends StatelessWidget {
  const GuitarStringSelectationPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/freatboard_mapping_levels'),
      builder: (context) => const GuitarStringSelectationPage(),
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
                const SizedBox(height: 30),
                FittedBox(
                  child: Text(
                    l10n.guitarStringSelectionTitle,
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                const SizedBox(height: 60),
                GradientButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(DiscoverTheNotePage.route(GuitarString.primeira));
                  },
                  child: Text(
                    '${l10n.guitarStringSelectionFirstEString} (E)',
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(height: 15),
                GradientButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(DiscoverTheNotePage.route(GuitarString.segunda));
                  },
                  child: Text(
                    '${l10n.guitarStringSelectionBString} (B)',
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(height: 15),
                GradientButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(DiscoverTheNotePage.route(GuitarString.terceira));
                  },
                  child: Text(
                    '${l10n.guitarStringSelectionGString} (G)',
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(height: 15),
                GradientButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(DiscoverTheNotePage.route(GuitarString.quarta));
                  },
                  child: Text(
                    '${l10n.guitarStringSelectionDString} (D)',
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(height: 15),
                GradientButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(DiscoverTheNotePage.route(GuitarString.quinta));
                  },
                  child: Text(
                    '${l10n.guitarStringSelectionAString} (A)',
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(height: 15),
                GradientButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(DiscoverTheNotePage.route(GuitarString.sexta));
                  },
                  child: Text(
                    '${l10n.guitarStringSelectionLastEString} (E)',
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(height: 15),
                GradientButton(
                  onPressed: () {
                    Navigator.of(context).push(DiscoverTheNotePage.route());
                  },
                  child: Text(
                    l10n.guitarStringSelectionAllStrings,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
