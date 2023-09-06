import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fretz/core/design_system/animations/confetti.dart';
import 'package:fretz/core/design_system/components/gradient_button.dart';
import 'package:fretz/core/domain/models/guitar_strings.dart';
import 'package:fretz/features/ads/ad_helper.dart';
import 'package:fretz/features/ads/widgets/banner_ad_widget.dart';
import 'package:fretz/features/discover_the_note/domain/usecases/get_note.dart';
import 'package:fretz/features/discover_the_note/presentation/view/widgets/fretz_card.dart';
import 'package:fretz/features/discover_the_note/presentation/view/widgets/guitar_freatboard.dart';
import 'package:fretz/features/discover_the_note/presentation/view/widgets/notes_keyboard.dart';
import 'package:fretz/l10n/l10n.dart';
import 'package:games_services/games_services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
  int answeredQuestionsCount = 0;

  final random = Random();

  GuitarString? currentString;
  int? currentFret;
  String currentNote = '';

  bool _duringCelebration = false;
  bool _hasAnswered = false;

  int _score = 0;
  double _lives = 3;
  int _rightAnswersCount = 0;

  static const _pointsPerRightAnswer = 10;
  static const _rightAnswerBonusNumber = 7;
  static const _pointsPerBonus = 50;
  static const int fretsCount = 16;
  static const int maxQuestionstToShowIntersticialAd = 3;

  InterstitialAd? _interstitialAd;

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              //_moveToHome();
            },
          );

          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          // TODO: call Crashlytics
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

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
    return BannerAdWidget(
      alignment: Alignment.bottomCenter,
      child: IgnorePointer(
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
                        context.l10n.discoverTheNoteTitle,
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
                                title:
                                    '${currentString?.number} ${context.l10n.discoverTheNoteString}',
                                content: currentString?.cipher ?? '',
                                complement: '',
                              ),
                            ),
                            const SizedBox(width: 28),
                            Expanded(
                              child: FretzCard(
                                title: context.l10n.discoverTheNoteFret,
                                content: currentFret?.toString() ?? '',
                                complement: '',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          8,
                          0,
                          8,
                          AdSize.banner.height + 0.0,
                        ),
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
      ),
    );
  }

  Future<void> handleRightAnswer() async {
    checkInteresticialAd();
    setState(() {
      _duringCelebration = true;
      _score += _pointsPerRightAnswer;
      _rightAnswersCount++;

      if (_rightAnswersCount >= _rightAnswerBonusNumber) {
        _score += _pointsPerBonus;
      }
    });
    await showNextQuestionDialog(context.l10n.discoverTheNoteCongrats);
  }

  void checkInteresticialAd() {
    answeredQuestionsCount++;

    if (answeredQuestionsCount >= maxQuestionstToShowIntersticialAd) {
      _interstitialAd?.show().then((value) => _interstitialAd = null);
      answeredQuestionsCount = 0;
    }
  }

  Future<void> handleWrongAnswer() async {
    checkInteresticialAd();
    setState(() {
      _rightAnswersCount = 0;
      _lives--;
    });
    if (_lives <= 0) {
      await _showGameOverDialog();
    } else {
      await showNextQuestionDialog(context.l10n.discoverTheNoteSorry);
    }
  }

  Future<void> showNextQuestionDialog(String title) async {
    if (answeredQuestionsCount == 2 && _interstitialAd == null) {
      _loadInterstitialAd();
    }
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
                  child: Text(
                    context.l10n.discoverTheNoteNextNote,
                    style: const TextStyle(
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

  Future<void> _showLeaderboards() async {
    if (await GameAuth.isSignedIn) {
      await Leaderboards.showLeaderboards();
    } else {
      // TODO: exibir que não está logado
    }
  }

  Widget _leaderboardsButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GradientButton(
        onPressed: _showLeaderboards,
        child: Text(
          context.l10n.mainMenuLeaderboards,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Future<void> _showGameOverDialog() async {
    unawaited(submitScore());
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
            context.l10n.discoverTheNoteGameOver,
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${context.l10n.discoverTheNoteScore}: $_score'),
              const SizedBox(height: 20),
              _leaderboardsButton(context),
              const SizedBox(height: 20),
              Row(
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
                        child: FittedBox(
                          child: Text(
                            context.l10n.discoverTheNoteRestart,
                            style: const TextStyle(
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
                        child: Text(
                          context.l10n.discoverTheNoteQuit,
                          style: const TextStyle(
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
            ],
          ),
          actions: const <Widget>[],
        );
      },
    );
  }

  Future<void> submitScore() async {
    if (await GameAuth.isSignedIn) {
      await Leaderboards.submitScore(
        score: Score(
          androidLeaderboardID: _getAndroidLeaderboardId(),
          // iOSLeaderboardID: 'ios_leaderboard_id',
          value: _score,
        ),
      );
    }
  }

  void _restartGame() {
    setState(() {
      _score = 0;
      _lives = 3;
      _rightAnswersCount = 0;
    });
  }

  String _getAndroidLeaderboardId() {
    switch (widget.string ?? '') {
      case GuitarString.primeira:
        return 'CgkI9ffyn-4cEAIQAQ';
      case GuitarString.segunda:
        return 'CgkI9ffyn-4cEAIQAg';
      case GuitarString.terceira:
        return 'CgkI9ffyn-4cEAIQAw';
      case GuitarString.quarta:
        return 'CgkI9ffyn-4cEAIQBA';
      case GuitarString.quinta:
        return 'CgkI9ffyn-4cEAIQBQ';
      case GuitarString.sexta:
        return 'CgkI9ffyn-4cEAIQBg';
      default:
        return 'CgkI9ffyn-4cEAIQBw'; // All Strings
    }
  }
}
