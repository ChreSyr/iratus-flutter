import 'package:flutter/widgets.dart';
import 'package:iratus_game/iratus_game.dart';

import 'models.dart';

/// Board aware Positioned widget
///
/// Use to position things, such as [Piece], [Highlight] on the board.
/// Since it's a wrapper over a [Positioned] widget it must be a descendant of a
/// [Stack].
class PositionedSquare extends StatelessWidget {
  const PositionedSquare({
    super.key,
    required this.child,
    required this.size,
    required this.orientation,
    required this.position,
  });

  final Widget child;
  final double size;
  final Side orientation;
  final Position position;

  @override
  Widget build(BuildContext context) {
    // TODO : improve offset
    final offset = Coord.fromSquareId(position.coord).offset(orientation, size);
    return Positioned(
      width: size,
      height: size,
      left: offset.dx,
      top: offset.dy,
      child: child,
    );
  }
}
