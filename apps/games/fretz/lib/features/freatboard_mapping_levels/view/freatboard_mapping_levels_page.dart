import 'package:flutter/material.dart';
import 'package:fretz/core/design_system/components/gradient_button.dart';
import 'package:fretz/features/freatboard_mapping_levels/view/guitar_string_selection_page.dart';

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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(23),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 30),
              const FittedBox(
                child: Text(
                  'Mapeamento do braço',
                  style: TextStyle(fontSize: 30),
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
                child: const Text(
                  'Descubra a nota',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(height: 15),
              const GradientButton(
                // onPressed: () {},
                child: Text(
                  'Descubra a casa',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
