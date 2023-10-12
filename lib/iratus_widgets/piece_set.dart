import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';

import 'models.dart';

const _pieceSetsPath = 'assets/piece_sets';

// TODO
/// The chess piece set that will be displayed on the board.
enum PieceSet {
  icySea('Icy Sea', PieceSet.icySeaAssets);

  final String label;

  /// The [PieceAssets] for this [PieceSet].
  final PieceAssets assets;

  const PieceSet(this.label, this.assets);

  static const PieceAssets icySeaAssets = IMapConst({
    PieceKind.blackRook:
        AssetImage('$_pieceSetsPath/icy_sea/br.png', package: 'iratus_ui'),
    PieceKind.blackPawn:
        AssetImage('$_pieceSetsPath/icy_sea/bp.png', package: 'iratus_ui'),
    PieceKind.blackKnight:
        AssetImage('$_pieceSetsPath/icy_sea/bn.png', package: 'iratus_ui'),
    PieceKind.blackBishop:
        AssetImage('$_pieceSetsPath/icy_sea/bb.png', package: 'iratus_ui'),
    PieceKind.blackQueen:
        AssetImage('$_pieceSetsPath/icy_sea/bq.png', package: 'iratus_ui'),
    PieceKind.blackKing:
        AssetImage('$_pieceSetsPath/icy_sea/bk.png', package: 'iratus_ui'),
    PieceKind.whiteRook:
        AssetImage('$_pieceSetsPath/icy_sea/wr.png', package: 'iratus_ui'),
    PieceKind.whitePawn:
        AssetImage('$_pieceSetsPath/icy_sea/wp.png', package: 'iratus_ui'),
    PieceKind.whiteKnight:
        AssetImage('$_pieceSetsPath/icy_sea/wn.png', package: 'iratus_ui'),
    PieceKind.whiteBishop:
        AssetImage('$_pieceSetsPath/icy_sea/wb.png', package: 'iratus_ui'),
    PieceKind.whiteQueen:
        AssetImage('$_pieceSetsPath/icy_sea/wq.png', package: 'iratus_ui'),
    PieceKind.whiteKing:
        AssetImage('$_pieceSetsPath/icy_sea/wk.png', package: 'iratus_ui'),
  });
}
