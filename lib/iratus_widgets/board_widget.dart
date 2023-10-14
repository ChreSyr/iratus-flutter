import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iratus/iratus_widgets/cubit/board_cubit.dart';
import 'package:iratus/iratus_widgets/cubit/board_state.dart';
import 'package:iratus_game/iratus_game.dart';

import 'board_settings.dart';
import 'models.dart';
import 'piece.dart';
import 'positioned_square.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({
    // required this.game,
    required this.interactableSide,
    // required this.orientation,
    required this.width,
    this.settings = const BoardSettings(),
    super.key,
  });

  /// The game represented by this widget
  // final IratusGame game;

  /// Which color is allowed to move? It can be both, none, white or black
  ///
  /// If `none` is chosen the board will be non interactable.
  final InteractableSide interactableSide;

  /// Side by which the board is oriented.
  // final Side orientation;

  /// Settings that control the theme, behavior and purpose of the board.
  final BoardSettings settings;

  /// Visal width of the board
  final double width;

  /// The size of a square in this board
  double get squareSize => width / 8;

  @override
  Widget build(BuildContext context) {
    final colorScheme = settings.colorScheme;

    return BlocBuilder<BoardCubit, BoardState>(
      builder: (context, state) {
        final game = state.game;
        final orientation = state.orientation;

        return SizedBox(
          width: width,
          height: width * 10 / 8,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              if (settings.enableCoordinates)
                orientation == Side.white
                    ? colorScheme.whiteCoordBackground
                    : colorScheme.blackCoordBackground
              else
                colorScheme.background,

              for (final piece in game.board.pieces.where((e) => !e.isCaptured))
                PositionedSquare(
                  // key: ValueKey('${piece.coord}-${piece.color}-${piece.id}'),
                  size: squareSize,
                  orientation: orientation,
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
      },
    );
  }
}
