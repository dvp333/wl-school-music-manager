enum GuitarString {
  primeira('1ª', 'E', 1),
  segunda('2ª', 'B', 1.2),
  terceira('3ª', 'G', 1.4),
  quarta('4ª', 'D', 1.6),
  quinta('5ª', 'A', 1.8),
  sexta('6ª', 'E', 2);

  static const octaveFretNumber = 12;

  const GuitarString(this.number, this.cipher, this.thickness);

  final String number;
  final String cipher;
  final double thickness;
}
