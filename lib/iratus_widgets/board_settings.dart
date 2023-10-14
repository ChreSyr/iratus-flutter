import 'package:flutter/widgets.dart';
import 'package:iratus/iratus_widgets/piece_set.dart';

import 'baord_color_scheme.dart';
import 'models.dart';

// TODO

/// Board settings that control the theme, behavior and purpose of the board.
///
/// This is meant for fixed settings that don't change during a game. Sensible
/// defaults are provided.
@immutable
class BoardSettings {
  const BoardSettings({
    // theme
    this.colorScheme = BoardColorScheme.brown2,
    this.pieceAssets = PieceSet.icySeaAssets, // TODO : other assets

    // visual settings
    this.enableCoordinates = true,
    this.animationDuration = const Duration(milliseconds: 250), // TODO : use
    this.showLastMove = true, // TODO : use
    this.showValidMoves = true, // TODO : use

    // behavior settings
    this.enablePremoveCastling = true, // TODO : use
    this.autoQueenPromotion = false, // TODO : use
  });

  /// Theme of the board
  final BoardColorScheme colorScheme;

  /// Piece set
  final PieceAssets pieceAssets;

  /// Whether to show board coordinates
  final bool enableCoordinates;

  /// Piece animation duration
  final Duration animationDuration;

  /// Whether to show last move highlight
  final bool showLastMove;

  /// Whether to show valid moves
  final bool showValidMoves;

  /// Whether castling is enabled with a premove.
  final bool enablePremoveCastling;

  /// If true the promotion selector won't appear and pawn will be promoted
  // automatically to queen
  final bool autoQueenPromotion;

  BoardSettings copyWith({
    BoardColorScheme? colorScheme,
    PieceAssets? pieceAssets,
    bool? enableCoordinates,
    Duration? animationDuration,
    bool? showLastMove,
    bool? showValidMoves,
    bool? blindfoldMode,
    double? dragFeedbackSize,
    Offset? dragFeedbackOffset,
    bool? enablePremoveCastling,
    bool? autoQueenPromotion,
    bool? autoQueenPromotionOnPremove,
  }) {
    return BoardSettings(
      colorScheme: colorScheme ?? this.colorScheme,
      pieceAssets: pieceAssets ?? this.pieceAssets,
      enableCoordinates: enableCoordinates ?? this.enableCoordinates,
      animationDuration: animationDuration ?? this.animationDuration,
      showLastMove: showLastMove ?? this.showLastMove,
      showValidMoves: showValidMoves ?? this.showValidMoves,
      enablePremoveCastling:
          enablePremoveCastling ?? this.enablePremoveCastling,
      autoQueenPromotion: autoQueenPromotion ?? this.autoQueenPromotion,
    );
  }
}
