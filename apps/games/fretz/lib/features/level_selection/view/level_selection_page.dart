import 'package:flutter/material.dart';
import 'package:fretz/core/design_system/components/gradient_button.dart';
import 'package:fretz/features/freatboard_mapping_levels/view/freatboard_mapping_levels_page.dart';

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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(23),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'Select level',
                style: TextStyle(fontSize: 45),
              ),
              const SizedBox(height: 60),
              GradientButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(FreatboardMappingLevelsPages.route());
                },
                child: const FittedBox(
                  child: Text(
                    'Mapeamento do braço',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const GradientButton(
                // onPressed: () {},
                child: FittedBox(
                  child: Text(
                    'Intervalos de 3 maior',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const GradientButton(
                // onPressed: () {},
                child: FittedBox(
                  child: Text(
                    'Intervalos de quarta',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const GradientButton(
                // onPressed: () {},
                child: FittedBox(
                  child: Text(
                    'Intervalos de quinta',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const GradientButton(
                // onPressed: () {},
                child: FittedBox(
                  child: Text(
                    'Intervalos de 3 menor',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
