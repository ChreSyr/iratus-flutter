import 'package:flutter/material.dart';
import 'package:iratus_game/iratus_game.dart';

import 'board_data.dart';
import 'board_settings.dart';
import 'piece.dart';
import 'positioned_square.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({
    required this.width,
    required this.data,
    this.settings = const BoardSettings(),
    super.key,
  });

  /// Data that represents the current state of the board
  final BoardData data;

  /// Settings that control the theme, behavior and purpose of the board.
  final BoardSettings settings;

  /// Visal width of the board
  final double width;

  /// The size of a square in this board
  double get squareSize => width / 8;

  @override
  Widget build(BuildContext context) {
    final game =
        data.fen == null ? IratusGame() : IratusGame.fromFEN(data.fen!);

    final colorScheme = settings.colorScheme;

    return SizedBox(
      width: width,
      height: width * 10 / 8,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          if (settings.enableCoordinates)
            data.orientation == Side.white
                ? colorScheme.whiteCoordBackground
                : colorScheme.blackCoordBackground
          else
            colorScheme.background,

          for (final piece in game.board.pieces.where((e) => !e.isCaptured))
            PositionedSquare(
              // key: ValueKey('${piece.coord}-${piece.color}-${piece.id}'),
              size: squareSize,
              orientation: data.orientation,
              position: piece.pos,
              child: PieceWidget(
                piece: piece,
                size: squareSize,
                pieceAssets: settings.pieceAssets,
              ),
            ),
          // const GameResultWidget(),
        ],
      ),
    );
  }
}
