import 'package:flutter/widgets.dart';
import 'package:iratus_game/iratus_game.dart';

import 'models.dart';

/// Board data.
///
/// Used to configure the board with state that will/may change during a game.
@immutable
class BoardData {
  const BoardData({
    required this.interactableSide,
    required this.orientation,
    this.fen,
    this.sideToMove = Side.white,
    this.premove,
    this.lastMove,
    this.validMoves,
    this.isCheck = false,
  });

  /// Which color is allowed to move? It can be both, none, white or black
  ///
  /// If `none` is chosen the board will be non interactable.
  final InteractableSide interactableSide;

  /// Side by which the board is oriented.
  final Side orientation;

  /// Side which is to move.
  final Side sideToMove;

  /// FEN string describing the position of the board.
  final String? fen;

  /// Registered premove. Will be played right after the next opponent move.
  final Move? premove;

  /// Last move played, used to highlight corresponding squares.
  final Move? lastMove;

  /// Set of [Move] allowed to be played by current side to move.
  final List<Move>? validMoves;

  /// Highlight the king of current side to move
  final bool isCheck;
}
