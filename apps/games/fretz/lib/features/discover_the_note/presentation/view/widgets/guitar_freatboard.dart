import 'package:flutter/material.dart';
import 'package:fretz/core/domain/models/guitar_strings.dart';

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
