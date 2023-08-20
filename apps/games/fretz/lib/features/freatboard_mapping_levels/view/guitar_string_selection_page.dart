import 'package:flutter/material.dart';
import 'package:fretz/core/design_system/components/gradient_button.dart';
import 'package:fretz/core/domain/models/guitar_strings.dart';
import 'package:fretz/features/discover_the_note/presentation/view/discover_the_note_page.dart';

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
                  'Escolha a corda',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(height: 60),
              GradientButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(DiscoverTheNotePage.route(GuitarString.primeira));
                },
                child: const Text(
                  'Primeira (E)',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(height: 15),
              GradientButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(DiscoverTheNotePage.route(GuitarString.segunda));
                },
                child: const Text(
                  'Segunda (B)',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(height: 15),
              GradientButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(DiscoverTheNotePage.route(GuitarString.terceira));
                },
                child: const Text(
                  'Terceira (G)',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(height: 15),
              GradientButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(DiscoverTheNotePage.route(GuitarString.quarta));
                },
                child: const Text(
                  'Quarta (D)',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(height: 15),
              GradientButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(DiscoverTheNotePage.route(GuitarString.quinta));
                },
                child: const Text(
                  'Quinta (A)',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(height: 15),
              GradientButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(DiscoverTheNotePage.route(GuitarString.sexta));
                },
                child: const Text(
                  'Sexta (E)',
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
