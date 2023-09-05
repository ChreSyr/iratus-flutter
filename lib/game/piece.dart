import 'package:flutter/material.dart';
import 'package:iratus/game/board.dart';

class Move {}

abstract class Piece {
  // Class attributes
  abstract String id;
  abstract List<List<int>> moves;

  // All the attributes are shared by every pieces, for easier transformations
  // They all have to be initialized

  // Piece
  final Board board;
  final String color;
  final String enemyColor;
  int row;
  int col;
  Move? firstMove;
  List<List<int>> validMoves = [];
  List<List<int>> antikingSquares = [];
  bool isCaptured = false;
  bool dynamited = false;
  Type? actualType; // needs to be nullable
  bool isWidgeted = false;
  Widget? widget;
  Piece? original; // for calculation pieces

  // Sorted alphabetically

  // Dog & Soldier
  Piece? linkedPiece;

  // Pawn
  List<List<int>> attackingMoves = [];
  int promotionRank = 0;

  // RollingPiece
  final int range = 0;

  Piece(this.board, this.color, this.row, this.col)
      : enemyColor = (color == "w") ? "b" : "w" {
    // this.runtimeType is not accessible from the initializer list
    actualType = runtimeType;
    board.addPiece(this);
  }

  // Used by Pawn & Soldier for moves depending on color
  void preciseTransform(Piece piece) {}
}

class Knight extends Piece {
  @override
  String id = 'n';
  @override
  List<List<int>> moves = [
    [2, 1],
    [2, -1],
    [-2, 1],
    [-2, -1],
    [1, 2],
    [1, -2],
    [-1, 2],
    [-1, -2],
  ];

  Knight(super.board, super.color, super.row, super.col);
}

class Pawn extends Piece {
  @override
  String id = "p";
  @override
  List<List<int>> moves =
      []; // real implementation is in Pawn.preciseTransform()

  Pawn(super.board, super.color, super.row, super.col) {
    preciseTransform(this);
  }

  @override
  void preciseTransform(Piece piece) {
    if (piece.color == 'b') {
      piece.moves = [
        [1, 0],
        [2, 0],
      ];
      piece.attackingMoves = [
        [1, 1],
        [1, -1],
      ];
      piece.promotionRank = 9;
    } else {
      piece.moves = [
        [-1, 0],
        [-2, 0],
      ];
      piece.attackingMoves = [
        [-1, 1],
        [-1, -1],
      ];
      piece.promotionRank = 0;
    }
  }
}

void main() {
  var board = IratusBoard(3, 3, 3);
  var piece = Pawn(board, "b", 0, 1);
  print("${piece.color} ${piece.moves}");
  var piece2 = Pawn(board, "w", 0, 1);
  print("${piece2.color} ${piece2.moves}");
  var knight = Knight(board, "w", 0, 1);
  print("${knight.color} ${knight.color}");
}
