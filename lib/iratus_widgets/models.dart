import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:iratus_game/iratus_game.dart';

/// Square highlight color or image on the chessboard.
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

/// Describes a set of piece assets.
///
/// The [PieceAssets] must be complete with all the pieces for both sides.
typedef PieceAssets = IMap<PieceKind, AssetImage>;

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
