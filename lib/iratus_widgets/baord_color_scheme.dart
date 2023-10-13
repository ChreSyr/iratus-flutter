import 'package:flutter/widgets.dart';
import 'package:iratus_game/iratus_game.dart';

import 'background.dart';
import 'models.dart';

/// Describes the color scheme of a [Board].
///
/// Use the static const members to ensure flutter doesn't rebuild the board more
/// than once.
class BoardColorScheme {
  const BoardColorScheme({
    required this.lightSquare,
    required this.darkSquare,
    required this.background,
    required this.whiteCoordBackground,
    required this.blackCoordBackground,
    required this.lastMove,
    required this.selected,
    required this.validMoves,
    required this.validPremoves,
  });

  /// Light square color of the board
  final Color lightSquare;

  /// Dark square color of the board
  final Color darkSquare;

  /// Board background that defines light and dark square colors
  final Background background;

  /// Board background that defines light and dark square colors and with white
  /// facing coordinates included
  final Background whiteCoordBackground;

  /// Board background that defines light and dark square colors and with black
  /// facing coordinates included
  final Background blackCoordBackground;

  /// Color of highlighted last move
  final HighlightDetails lastMove;

  /// Color of highlighted selected square
  final HighlightDetails selected;

  /// Color of squares occupied with valid moves dots
  final Color validMoves;

  /// Color of squares occupied with valid premoves dots
  final Color validPremoves;

  static const blue = BoardColorScheme(
    lightSquare: Color(0xffdee3e6),
    darkSquare: Color(0xff8ca2ad),
    background: SolidColorBackground(
      lightSquare: Color(0xffdee3e6),
      darkSquare: Color(0xff8ca2ad),
    ),
    whiteCoordBackground: SolidColorBackground(
      lightSquare: Color(0xffdee3e6),
      darkSquare: Color(0xff8ca2ad),
      coordinates: true,
    ),
    blackCoordBackground: SolidColorBackground(
      lightSquare: Color(0xffdee3e6),
      darkSquare: Color(0xff8ca2ad),
      coordinates: true,
      orientation: Side.black,
    ),
    lastMove: HighlightDetails(solidColor: Color(0x809bc700)),
    selected: HighlightDetails(solidColor: Color(0x6014551e)),
    validMoves: Color(0x4014551e),
    validPremoves: Color(0x40203085),
  );

  static const brown = BoardColorScheme(
    lightSquare: Color(0xfff0d9b6),
    darkSquare: Color(0xffb58863),
    background: SolidColorBackground(
      lightSquare: Color(0xfff0d9b6),
      darkSquare: Color(0xffb58863),
    ),
    whiteCoordBackground: SolidColorBackground(
      lightSquare: Color(0xfff0d9b6),
      darkSquare: Color(0xffb58863),
      coordinates: true,
    ),
    blackCoordBackground: SolidColorBackground(
      lightSquare: Color(0xfff0d9b6),
      darkSquare: Color(0xffb58863),
      coordinates: true,
      orientation: Side.black,
    ),
    lastMove: HighlightDetails(solidColor: Color(0x809cc700)),
    selected: HighlightDetails(solidColor: Color(0x6014551e)),
    validMoves: Color(0x4014551e),
    validPremoves: Color(0x40203085),
  );

  static const brown2 = BoardColorScheme(
    lightSquare: Color(0xffffefd7),
    darkSquare: Color(0xffb68359),
    background: SolidColorBackground(
      lightSquare: Color(0xffffefd7),
      darkSquare: Color(0xffb68359),
    ),
    whiteCoordBackground: SolidColorBackground(
      lightSquare: Color(0xffffefd7),
      darkSquare: Color(0xffb68359),
      coordinates: true,
    ),
    blackCoordBackground: SolidColorBackground(
      lightSquare: Color(0xffffefd7),
      darkSquare: Color(0xffb68359),
      coordinates: true,
      orientation: Side.black,
    ),
    lastMove: HighlightDetails(solidColor: Color(0x809bc700)),
    selected: HighlightDetails(solidColor: Color(0x6014551e)),
    validMoves: Color(0x4014551e),
    validPremoves: Color(0x40203085),
  );

  static const green = BoardColorScheme(
    lightSquare: Color(0xffffffdd),
    darkSquare: Color(0xff86a666),
    background: SolidColorBackground(
      lightSquare: Color(0xffffffdd),
      darkSquare: Color(0xff86a666),
    ),
    whiteCoordBackground: SolidColorBackground(
      lightSquare: Color(0xffffffdd),
      darkSquare: Color(0xff86a666),
      coordinates: true,
    ),
    blackCoordBackground: SolidColorBackground(
      lightSquare: Color(0xffffffdd),
      darkSquare: Color(0xff86a666),
      coordinates: true,
      orientation: Side.black,
    ),
    lastMove: HighlightDetails(solidColor: Color.fromRGBO(0, 155, 199, 0.41)),
    selected: HighlightDetails(solidColor: Color.fromRGBO(216, 85, 0, 0.3)),
    validMoves: Color.fromRGBO(0, 0, 0, 0.20),
    validPremoves: Color(0x40203085),
  );

  static const grey = BoardColorScheme(
    lightSquare: Color(0xffe0e9e0),
    darkSquare: Color(0xff747974),
    background: SolidColorBackground(
      lightSquare: Color(0xffe0e9e0),
      darkSquare: Color(0xff747974),
    ),
    whiteCoordBackground: SolidColorBackground(
      lightSquare: Color(0xffe0e9e0),
      darkSquare: Color(0xff747974),
      coordinates: true,
    ),
    blackCoordBackground: SolidColorBackground(
      lightSquare: Color(0xffe0e9e0),
      darkSquare: Color(0xff747974),
      coordinates: true,
      orientation: Side.black,
    ),
    lastMove: HighlightDetails(solidColor: Color(0x809cc700)),
    selected: HighlightDetails(solidColor: Color(0x6014551e)),
    validMoves: Color(0x4014551e),
    validPremoves: Color(0x40203085),
  );
}
