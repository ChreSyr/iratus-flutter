import 'package:iratus/game/piece.dart';

abstract class Board {
  final Object game;
  final int nbranks;
  final int nbfiles;

  Board(this.game, this.nbranks, this.nbfiles);

  void addPiece(Piece piece);
}

class IratusBoard extends Board {
  IratusBoard(super.game, super.nbranks, super.nbfiles);

  @override
  void addPiece(Piece piece) {
    1;
  }
}
