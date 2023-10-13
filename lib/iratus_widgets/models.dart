import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:iratus_game/iratus_game.dart';

/// Files of the iratus board.
const files = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'];

/// Ranks of the iratus board.
const ranks = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

/// All the squares of the chessboard.
final List<SquareId> allSquares = List.unmodifiable([
  for (final f in files)
    for (final r in ranks) '$f$r',
]);

/// Zero-based numeric board coordinate.
///
/// For instance a0 is (0, 0), a1 is (0, 1), etc.
@immutable
class Coord {
  const Coord({
    required this.x,
    required this.y,
  })  : assert(x >= 0 && x <= 7),
        assert(y >= 0 && y <= 9);

  Coord.fromSquareId(SquareId id)
      : x = id.codeUnitAt(0) - 97,
        y = id.codeUnitAt(1) - 48;

  final int x;
  final int y;

  SquareId get squareId => allSquares[10 * x + y];

  Offset offset(Side orientation, double squareSize) {
    final dx = (orientation == Side.black ? 7 - x : x) * squareSize;
    final dy = (orientation == Side.black ? y : 9 - y) * squareSize;
    return Offset(dx, dy);
  }

  @override
  String toString() {
    return '($x, $y)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Coord &&
            other.runtimeType == runtimeType &&
            other.x == x &&
            other.y == y;
  }

  @override
  int get hashCode => Object.hash(x, y);
}

/// Square highlight color or image on the iratus board.
class HighlightDetails {
  const HighlightDetails({
    this.solidColor,
    this.image,
  }) : assert(
          solidColor != null || image != null,
          'You must provide either `solidColor` or `image`.',
        );

  final Color? solidColor;
  final AssetImage? image;
}

/// The side that can interact with the board.
enum InteractableSide { both, none, white, black }

/// Piece kind, such as white pawn, black knight, etc.
enum PieceKind {
  whitePawn,
  whiteKnight,
  whiteBishop,
  whiteRook,
  whiteQueen,
  whiteKing,
  whiteDog,
  whiteEnragedDog,
  whiteSoldier,
  whiteEliteSoldier,
  whiteDynamite,
  whitePhantom,
  whiteGrapple,
  blackPawn,
  blackKnight,
  blackBishop,
  blackRook,
  blackQueen,
  blackKing,
  blackDog,
  blackEnragedDog,
  blackSoldier,
  blackEliteSoldier,
  blackDynamite,
  blackPhantom,
  blackGrapple;

  static PieceKind fromPiece(Piece piece) {
    switch (piece.id) {
      case Role.pawn:
        return piece.color == Side.white
            ? PieceKind.whitePawn
            : PieceKind.blackPawn;
      case Role.knight:
        return piece.color == Side.white
            ? PieceKind.whiteKnight
            : PieceKind.blackKnight;
      case Role.bishop:
        return piece.color == Side.white
            ? PieceKind.whiteBishop
            : PieceKind.blackBishop;
      case Role.rook:
        return piece.color == Side.white
            ? PieceKind.whiteRook
            : PieceKind.blackRook;
      case Role.queen:
        return piece.color == Side.white
            ? PieceKind.whiteQueen
            : PieceKind.blackQueen;
      case Role.king:
        return piece.color == Side.white
            ? PieceKind.whiteKing
            : PieceKind.blackKing;
      case Role.dog:
        return piece.color == Side.white
            ? PieceKind.whiteDog
            : PieceKind.blackDog;
      case Role.enragedDog:
        return piece.color == Side.white
            ? PieceKind.whiteEnragedDog
            : PieceKind.blackEnragedDog;
      case Role.soldier:
        return piece.color == Side.white
            ? PieceKind.whiteSoldier
            : PieceKind.blackSoldier;
      case Role.eliteSoldier:
        return piece.color == Side.white
            ? PieceKind.whiteEliteSoldier
            : PieceKind.blackEliteSoldier;
      case Role.dynamite:
        return piece.color == Side.white
            ? PieceKind.whiteDynamite
            : PieceKind.blackDynamite;
      case Role.phantom:
        return piece.color == Side.white
            ? PieceKind.whitePhantom
            : PieceKind.blackPhantom;
      case Role.grapple:
        return piece.color == Side.white
            ? PieceKind.whiteGrapple
            : PieceKind.blackGrapple;
    }
  }
}

/// Describes a set of piece assets.
///
/// The [PieceAssets] must be complete with all the pieces for both sides.
typedef PieceAssets = IMap<PieceKind, AssetImage>;

/// Representation of the piece positions on a board.
typedef Pieces = Map<SquareId, Piece>;

/// Square identifier using the algebraic coordinate notation such as e2, c3, etc.
typedef SquareId = String;
