enum MusicNote {
  C('C', 0.5),
  cSharp('C#', 1.0),
  D('D', 1.5),
  dSharp('D#', 2.0),
  E('E', 2.5),
  F('F', 3.0),
  fSharp('F#', 3.5),
  G('G', 4.0),
  gSharp('G#', 4.5),
  A('A', 5.0),
  aSharp('A#', 5.5),
  B('B', 6.0);

  static const halfToneValue = 0.5;

  const MusicNote(this.cipher, this.value);

  final String cipher;
  final double value;
}
