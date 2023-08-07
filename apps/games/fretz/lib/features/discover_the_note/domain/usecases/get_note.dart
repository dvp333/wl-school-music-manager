import 'package:fretz/core/domain/models/guitar_strings.dart';
import 'package:fretz/core/domain/models/music_note.dart';

class GetNote {
  String call(String stringCipher, int fretNumber) {
    final maxNoteValue = MusicNote.B.value;
    const octaveFretNumber = GuitarString.octaveFretNumber;
    final newFretNumber = fretNumber >= octaveFretNumber
        ? (fretNumber - octaveFretNumber)
        : fretNumber;
    final note =
        MusicNote.values.where((note) => note.cipher == stringCipher).first;
    var noteValue = note.value + (MusicNote.halfToneValue * newFretNumber);
    noteValue =
        noteValue > maxNoteValue ? (noteValue - maxNoteValue) : noteValue;
    final fretNote =
        MusicNote.values.where((note) => note.value == noteValue).first.cipher;
    return fretNote;
  }
}
