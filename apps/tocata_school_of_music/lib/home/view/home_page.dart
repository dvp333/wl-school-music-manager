import 'package:dart_melty_soundfont/dart_melty_soundfont.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tocata_school_of_music/app/view/bloc/app_bloc.dart';
import 'package:tocata_school_of_music/home/home.dart';
import 'package:wl_music_school_manager/wl_music_school_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Image.asset(
          TocataImages.logo,
          package: TocataImages.packageName,
          height: 30,
        ),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<AppBloc>().add(const AppLogoutRequested());
            },
          )
        ],
      ),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
              onTap: () async {
                try {
                  //   final midi = MidiPlayer();
                  //   await midi.load(WLSounds.overdrivenGuitar);
                  //   await midi.playNote(note: 1, velocity: 1);

                  // Create the synthesizer.
                  final bytes = await rootBundle.load(WLSounds.eletricGuitar);

                  final synth = Synthesizer.loadByteData(
                    bytes,
                    SynthesizerSettings(),
                  );
                  debugPrint(synth.soundFont.presets.toString());
                } catch (e) {
                  debugPrint(e.toString());
                }
              },
              child: Avatar(photo: user.photo),
            ),
            const SizedBox(height: 30),
            Text('Bem-vindo', style: textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(user.name ?? '', style: textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(user.email ?? '', style: textTheme.titleSmall),
          ],
        ),
      ),
    );
  }
}
