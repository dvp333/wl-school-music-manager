import 'package:flutter/material.dart';
import 'package:fretz/core/design_system/components/gradient_button.dart';
import 'package:fretz/features/freatboard_mapping_levels/view/guitar_string_selection_page.dart';
import 'package:fretz/l10n/l10n.dart';

class FreatboardMappingLevelsPages extends StatelessWidget {
  const FreatboardMappingLevelsPages({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/freatboard_mapping_levels'),
      builder: (context) => const FreatboardMappingLevelsPages(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(23),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 30),
              FittedBox(
                child: Text(
                  l10n.fretboardMappingSelectionTitle,
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(height: 60),
              GradientButton(
                onPressed: () {
                  // Navigator.of(context)
                  //     .push(DiscoverTheNotePage.route(GuitarString.primeira));
                  Navigator.of(context)
                      .push(GuitarStringSelectationPage.route());
                },
                child: Text(
                  l10n.fretboardMappingSelectionWhatsTheNote,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(height: 15),
              GradientButton(
                // onPressed: () {},
                child: Text(
                  l10n.fretboardMappingSelectionWhatsTheFret,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
