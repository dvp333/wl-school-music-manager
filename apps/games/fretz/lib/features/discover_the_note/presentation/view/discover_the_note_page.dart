import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fretz/core/design_system/animations/confetti.dart';
import 'package:fretz/core/design_system/components/gradient_button.dart';
import 'package:fretz/core/domain/models/guitar_strings.dart';
import 'package:fretz/features/discover_the_note/domain/usecases/get_note.dart';
import 'package:fretz/features/discover_the_note/presentation/view/widgets/fretz_card.dart';
import 'package:fretz/features/discover_the_note/presentation/view/widgets/guitar_freatboard.dart';
import 'package:fretz/features/discover_the_note/presentation/view/widgets/notes_keyboard.dart';

class DiscoverTheNotePage extends StatefulWidget {
  const DiscoverTheNotePage({super.key, this.string});

  final GuitarString? string;

  static Route<void> route([GuitarString? string]) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/discover_the_note'),
      builder: (context) => DiscoverTheNotePage(
        string: string,
      ),
    );
  }

  @override
  State<DiscoverTheNotePage> createState() => _DiscoverTheNotePageState();
}

class _DiscoverTheNotePageState extends State<DiscoverTheNotePage> {
  GuitarString? currentString;
  int? currentFret;
  static const int fretsCount = 16;
  // static const int secondsToAnswer = 30;
  String currentNote = '';

  // int currentTimerCount = secondsToAnswer;
  // Timer? _timer;

  final random = Random();

  bool _duringCelebration = false;
  bool _hasAnswered = false;

  int _score = 0;
  double _lives = 3;
  int _rightAnswersCount = 0;

  static const _pointsPerRightAnswer = 10;
  static const _rightAnswerBonusNumber = 7;
  static const _pointsPerBonus = 50;

  @override
  void initState() {
    super.initState();
    _generateNextQuestion();
  }

  void _generateNextQuestion() {
    setState(() {
      _duringCelebration = false;
      _hasAnswered = false;

      if (widget.string != null) {
        currentString = widget.string;
      } else {
        final stringsCount = GuitarString.values.length;
        currentString = GuitarString.values[random.nextInt(stringsCount)];
      }

      currentFret = random.nextInt(fretsCount) + 1;
      currentNote = GetNote()(currentString!.cipher, currentFret!);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        // currentTimerCount = secondsToAnswer;
        // _timer?.cancel();
        // _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        //   setState(() {
        //     if (currentTimerCount == 0) {
        //       timer.cancel();
        //     } else {
        //       currentTimerCount--;
        //     }
        //   });
        // });
      });
    });
  }

  late BuildContext _rootBuildContext;

  @override
  Widget build(BuildContext context) {
    _rootBuildContext = context;
    final style = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(color: Colors.white);
    return IgnorePointer(
      ignoring: _hasAnswered,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _score.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: _buildLives(),
            ),
          ),
          leadingWidth: 200,
        ),
        body: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 150),
              child: Image(image: AssetImage('assets/images/bg.png')),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.zero,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Descubra a nota',
                      style: style,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Stack(
                      children: [
                        const GuitarFretBoard(),
                        GuitarFretBoard(
                          backgroundColor: Colors.transparent,
                          fretColor: Colors.transparent,
                          markerColor: Colors.transparent,
                          selectedString: currentString,
                          selectFret: currentFret,
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FretzCard(
                              title: '${currentString?.number} Corda',
                              content: currentString?.cipher ?? '',
                              complement: '',
                            ),
                          ),
                          const SizedBox(width: 28),
                          Expanded(
                            child: FretzCard(
                              title: 'Casa',
                              content: currentFret?.toString() ?? '',
                              complement: '',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: NotesKeyboard(
                        rightAnswer: currentNote,
                        showAnswer: true,
                        onTap: () => setState(() => _hasAnswered = true),
                        onRightAnswerGiven: handleRightAnswer,
                        onWrongAnswerGiven: handleWrongAnswer,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox.expand(
              child: AnimatedOpacity(
                opacity: _duringCelebration ? 1 : 0,
                duration: const Duration(milliseconds: 300),
                child: IgnorePointer(
                  child: Confetti(
                    isStopped: !_duringCelebration,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> handleRightAnswer() async {
    setState(() {
      _duringCelebration = true;
      _score += _pointsPerRightAnswer;
      _rightAnswersCount++;

      if (_rightAnswersCount >= _rightAnswerBonusNumber) {
        _score += _pointsPerBonus;
      }
    });
    await showNextQuestionDialog('Parabéns!');
  }

  Future<void> handleWrongAnswer() async {
    setState(() {
      _rightAnswersCount = 0;
      _lives--;
    });
    if (_lives <= 0) {
      await _showGameOverDialog();
    } else {
      await showNextQuestionDialog('Que pena, não foi dessa vez.');
    }
  }

  Future<void> showNextQuestionDialog(String title) async {
    await showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                height: 50,
                child: GradientButton(
                  onPressed: () {
                    _generateNextQuestion();
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Próxima nota',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: const <Widget>[],
        );
      },
    );
  }

  void doNothingForNow() {}

  List<Widget> _buildLives() {
    final widgets = <Widget>[];

    for (var i = 0; i < _lives; i++) {
      widgets.add(
        const Image(
          image: AssetImage('assets/images/guitar_life.png'),
          height: 30,
        ),
      );
    }

    return widgets;
  }

  Future<void> _showGameOverDialog() async {
    await showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          title: const Text(
            'GAME OVER',
            textAlign: TextAlign.center,
          ),
          content: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: GradientButton(
                    onPressed: () {
                      _restartGame();
                      _generateNextQuestion();
                      Navigator.of(context).pop();
                    },
                    child: const FittedBox(
                      child: Text(
                        'Reiniciar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: GradientButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(_rootBuildContext)
                          .popUntil((route) => route.isFirst);
                    },
                    child: const Text(
                      'Sair',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: const <Widget>[],
        );
      },
    );
  }

  void _restartGame() {
    setState(() {
      _score = 0;
      _lives = 3;
      _rightAnswersCount = 0;
    });
  }
}
