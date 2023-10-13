import 'package:flutter/material.dart';
import 'package:iratus_game/iratus_game.dart';

import 'board_data.dart';
import 'board_settings.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({
    required this.data,
    this.settings = const BoardSettings(),
    super.key,
  });

  /// Settings that control the theme, behavior and purpose of the board.
  final BoardSettings settings;

  /// Data that represents the current state of the board
  final BoardData data;

  @override
  Widget build(BuildContext context) {
    final colorScheme = settings.colorScheme;

    return AspectRatio(
      aspectRatio: 8 / 10,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          data.orientation == Side.white
              ? colorScheme.whiteCoordBackground
              : colorScheme.blackCoordBackground,
          // const GameResultWidget(),
        ],
      ),
    );
  }
}
