import 'package:flutter/material.dart';
import 'package:iratus_game/iratus_game.dart';

import 'board_data.dart';
import 'board_settings.dart';

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
          // if (settings.showLastMove && data.lastMove != null)
          //   for (final squareId in data.lastMove!.squares)
          //     if (premove == null || !premove.hasSquare(squareId))
          //       PositionedSquare(
          //         key: ValueKey('$squareId-lastMove'),
          //         size: squareSize,
          //         orientation: data.orientation,
          //         squareId: squareId,
          //         child: Highlight(
          //           size: squareSize,
          //           details: colorScheme.lastMove,
          //         ),
          //       ),
          // const GameResultWidget(),
        ],
      ),
    );
  }
}
