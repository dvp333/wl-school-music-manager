import 'package:flutter/material.dart';
import 'package:fretz/core/design_system/fretz_colors.dart';
import 'package:fretz/core/domain/models/music_note.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class NotesKeyboard extends StatefulWidget {
  const NotesKeyboard({
    required this.rightAnswer,
    required this.onRightAnswerGiven,
    required this.onWrongAnswerGiven,
    super.key,
    this.showAnswer = false,
    this.onTap,
  });

  final String rightAnswer;
  final Future<void> Function() onRightAnswerGiven;
  final Future<void> Function() onWrongAnswerGiven;
  final VoidCallback? onTap;
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
            onPressed: () {
              widget.onTap?.call();
              selectedNote = MusicNote.values[index].cipher;
              final hasAnsweredRight = selectedNote == widget.rightAnswer;
              final Future<void> Function() action;
              if (hasAnsweredRight) {
                action = () => widget.onRightAnswerGiven();
              } else {
                action = () => widget.onWrongAnswerGiven();
              }
              Future.delayed(const Duration(milliseconds: 200), () async {
                await action();
                setState(() {
                  selectedNote = '';
                });
              });
            },
            child: GradientText(
              MusicNote.values[index].cipher,
              style: const TextStyle(
                fontSize: 25,
                fontFamily: 'Poppins',
              ),
              colors: hasAnsweredQuestion
                  ? [Colors.white, Colors.white]
                  : [
                      FretzColors.redGradient,
                      FretzColors.yellowGradient,
                      //add more colors here.
                    ],
            ),
          );
        },
      ),
    );
  }
}
