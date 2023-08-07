import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fretz/core/design_system/components/gradient_button.dart';
import 'package:fretz/core/domain/models/guitar_strings.dart';
import 'package:fretz/core/domain/models/music_note.dart';
import 'package:fretz/features/discover_the_note/domain/usecases/get_note.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class DiscoverTheNotePage extends StatefulWidget {
  const DiscoverTheNotePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/discover_the_note'),
      builder: (context) => const DiscoverTheNotePage(),
    );
  }

  @override
  State<DiscoverTheNotePage> createState() => _DiscoverTheNotePageState();
}

class _DiscoverTheNotePageState extends State<DiscoverTheNotePage> {
  GuitarString? currentString;
  int? currentFret;
  static const int fretsCount = 21;
  // static const int secondsToAnswer = 30;
  String currentNote = '';

  // int currentTimerCount = secondsToAnswer;
  // Timer? _timer;

  final random = Random();

  @override
  void initState() {
    super.initState();
    _generateNextQuestion();
  }

  void _generateNextQuestion() {
    setState(() {
      final stringsCount = GuitarString.values.length;
      currentString = GuitarString.values[random.nextInt(stringsCount)];
      currentFret = random.nextInt(fretsCount + 1);
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

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(color: Colors.white);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '245245',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
        leading: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Row(
            children: [
              Image(
                image: AssetImage('assets/images/guitar_life.png'),
                height: 30,
              ),
              Image(
                image: AssetImage('assets/images/guitar_life.png'),
                height: 30,
              ),
              Image(
                image: AssetImage('assets/images/guitar_life.png'),
                height: 30,
              )
            ],
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
              padding: const EdgeInsets.all(0),
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
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: _FretzCard(
                            title: 'Corda',
                            content: currentString?.number ?? '',
                            complement: '(${currentString?.cipher})',
                          ),
                        ),
                        const SizedBox(width: 26),
                        Expanded(
                          child: _FretzCard(
                            title: 'Casa',
                            content: currentFret?.toString() ?? '',
                          ),
                        ),
                      ],
                    ),
                  ),
                  // _FretzCard(
                  //   title: 'Nota',
                  //   content: currentNote,
                  // ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: NotesKeyboard(
                      rightAnswer: currentNote,
                      showAnswer: true,
                      onRightAnswerGiven: () => showNextQuestion(true),
                      onWrongAnswerGiven: () => showNextQuestion(false),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 16.0),
                  //   child: SizedBox(
                  //     width: double.infinity,
                  //     height: 50.0,
                  //     child: ElevatedButton(
                  //         onPressed: (_timer?.isActive ?? true)
                  //             ? null
                  //             : _generateNextQuestion,
                  //         child: const Text('Próximo')),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showNextQuestion(bool hasAnsweredRight) {
    unawaited(
      showDialog<void>(
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
              hasAnsweredRight ? 'Parabéns!' : 'Não foi dessa vez ;)',
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
            actions: const <Widget>[
              // TextButton(
              //   style: TextButton.styleFrom(
              //     textStyle: Theme.of(context).textTheme.labelLarge,
              //   ),
              //   child: const Text('Disable'),
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //   },
              // ),
              // TextButton(
              //   style: TextButton.styleFrom(
              //     textStyle: Theme.of(context).textTheme.labelLarge,
              //   ),
              //   child: const Text('Enable'),
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //   },
              // ),
            ],
          );
        },
      ),
    );
  }

  void doNothingForNow() {}
}

class _FretzCard extends StatelessWidget {
  const _FretzCard({
    required this.title,
    required this.content,
    this.complement = '',
  });

  final String title;
  final String content;
  final String complement;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFFD5B51C), Color(0xFFE33A61)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 2,
            offset: Offset(2, 2), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  content,
                  style: const TextStyle(fontSize: 48),
                ),
                const SizedBox(width: 5),
                Text(
                  complement,
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotesKeyboard extends StatefulWidget {
  const NotesKeyboard({
    required this.rightAnswer,
    required this.onRightAnswerGiven,
    required this.onWrongAnswerGiven,
    super.key,
    this.showAnswer = false,
  });

  final String rightAnswer;
  final VoidCallback onRightAnswerGiven;
  final VoidCallback onWrongAnswerGiven;
  final bool showAnswer;

  @override
  State<NotesKeyboard> createState() => _NotesKeyboardState();
}

class _NotesKeyboardState extends State<NotesKeyboard> {
  String selectedNote = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      padding: const EdgeInsets.only(bottom: 10),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: MusicNote.values.length,
        itemBuilder: (context, index) {
          final isAnswerButton = selectedNote.isNotEmpty &&
              MusicNote.values[index].cipher == widget.rightAnswer;
          final hasAnsweredRight = selectedNote == widget.rightAnswer;
          final hasAnsweredQuestion = (selectedNote.isNotEmpty &&
                  MusicNote.values[index].cipher == selectedNote) ||
              isAnswerButton;
          return ElevatedButton(
            style: hasAnsweredQuestion
                ? ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      hasAnsweredRight || isAnswerButton
                          ? Colors.green[600]
                          : Colors.red[600],
                    ),
                  )
                : ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                  ),
            onPressed: () => setState(() {
              selectedNote = MusicNote.values[index].cipher;
              final hasAnsweredRight = selectedNote == widget.rightAnswer;
              final void Function() action;
              if (hasAnsweredRight) {
                action = () => widget.onRightAnswerGiven();
              } else {
                action = () => widget.onWrongAnswerGiven();
              }
              Future.delayed(const Duration(seconds: 1), () {
                action();
                selectedNote = '';
              });
            }),
            child: GradientText(
              MusicNote.values[index].cipher,
              style: const TextStyle(
                fontSize: 25,
                fontFamily: 'Poppins',
              ),
              colors: hasAnsweredQuestion
                  ? [Colors.white, Colors.white]
                  : [
                      Colors.redAccent.shade200,
                      Colors.yellowAccent.shade700,
                      //add mroe colors here.
                    ],
            ),
          );
        },
      ),
    );
  }
}

class GuitarFretBoard extends StatefulWidget {
  const GuitarFretBoard({
    super.key,
    this.backgroundColor = Colors.brown,
    this.fretColor,
    this.markerColor = Colors.white,
    this.selectedString,
    this.selectFret,
  });

  static const numberOfFrets = 22;
  static const numberOfFretsWires = 21;
  final Color backgroundColor;
  final Color? fretColor;
  final Color markerColor;
  final GuitarString? selectedString;
  final int? selectFret;

  @override
  State<GuitarFretBoard> createState() => _GuitarFretBoardState();
}

class _GuitarFretBoardState extends State<GuitarFretBoard>
    with TickerProviderStateMixin {
  final DecorationTween tween = DecorationTween(
    begin: const BoxDecoration(color: Colors.grey),
    end: const BoxDecoration(
      color: Colors.yellowAccent,
      boxShadow: [
        BoxShadow(
          color: Colors.yellowAccent,
          spreadRadius: 2,
          blurRadius: 5,
        ),
      ],
    ),
  );

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: buildColumnWidths(),
      children: [
        edgePieceOfFreatboard(),
        buildString(GuitarString.primeira),
        pieceBetweenStrings(),
        buildString(GuitarString.segunda),
        pieceBetweenStrings(showOctaveMarkers: true),
        buildString(GuitarString.terceira),
        pieceBetweenStrings(showMiddleMarkers: true),
        buildString(GuitarString.quarta),
        pieceBetweenStrings(showOctaveMarkers: true),
        buildString(GuitarString.quinta),
        pieceBetweenStrings(),
        buildString(GuitarString.sexta),
        edgePieceOfFreatboard(),
      ],
    );
  }

  TableRow edgePieceOfFreatboard() {
    const height = 3.5;
    final fret = Container(
      height: height,
      color: widget.backgroundColor,
    );

    final fretWire = Container(
      height: height,
      color: Colors.grey.shade300,
    );

    final fretboard = <Widget>[];

    for (var i = 0;
        i <
            (GuitarFretBoard.numberOfFrets +
                GuitarFretBoard.numberOfFretsWires);
        i++) {
      fretboard.add(i % 2 == 0 ? fret : fretWire);
    }

    return TableRow(
      children: fretboard,
    );
  }

  TableRow pieceBetweenStrings({
    bool showMiddleMarkers = false,
    bool showOctaveMarkers = false,
  }) {
    const height = 8.5;

    final fret = Container(
      height: height,
      color: widget.backgroundColor,
    );

    final fretWithMarker = Container(
      height: height,
      color: widget.backgroundColor,
      child: Center(
        child: Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.markerColor,
          ),
        ),
      ),
    );

    final fretWire = Container(
      height: height,
      color: widget.fretColor ?? Colors.grey[300],
    );

    final fretboard = <Widget>[];
    var fretCount = 1;

    for (var i = 0;
        i <
            (GuitarFretBoard.numberOfFrets +
                GuitarFretBoard.numberOfFretsWires);
        i++) {
      Widget widget = fretWire;

      if (i % 2 == 0) {
        widget = fret;
        if (((fretCount == 3 ||
                    fretCount == 5 ||
                    fretCount == 7 ||
                    fretCount == 9 ||
                    fretCount == 15 ||
                    fretCount == 17) &&
                showMiddleMarkers) ||
            (fretCount == 12 && showOctaveMarkers)) {
          widget = fretWithMarker;
        }
        fretCount++;
      }

      fretboard.add(widget);
    }

    return TableRow(
      children: fretboard,
    );
  }

  TableRow buildString(GuitarString string) {
    final stringPart = Container(
      height: string.thickness,
      color: Colors.grey,
    );

    final stringE = <Widget>[];

    var currentFret = 0;

    for (var i = 0;
        i <
            (GuitarFretBoard.numberOfFrets +
                GuitarFretBoard.numberOfFretsWires);
        i++) {
      if (i % 2 == 0) currentFret++;

      if (string == widget.selectedString && currentFret == widget.selectFret) {
        stringE.add(
          DecoratedBoxTransition(
            decoration: tween.animate(_animationController),
            child: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              height: string.thickness,
            ),
          ),
        );
      } else {
        stringE.add(stringPart);
      }
    }

    return TableRow(
      children: stringE,
    );
  }

  Map<int, TableColumnWidth> buildColumnWidths() {
    final columnWidths = <int, TableColumnWidth>{};

    const fretFactor = 17.817;
    const scaleLenght = 25.5;
    var fretSpacing = 0.0;

    for (var i =
            GuitarFretBoard.numberOfFrets + GuitarFretBoard.numberOfFretsWires;
        i >= 0;
        i--) {
      if (i.isEven) {
        fretSpacing = scaleLenght / fretFactor + fretSpacing;
      }
      columnWidths.addAll({
        i: (i.isEven ? FlexColumnWidth(fretSpacing) : const FixedColumnWidth(2))
      });
    }

    return columnWidths;
  }
}
