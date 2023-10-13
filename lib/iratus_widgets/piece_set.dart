import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';

import 'models.dart';

const _pieceSetsPath = 'assets/piece_sets';

// TODO
/// The chess piece set that will be displayed on the board.
enum PieceSet {
  icySea('Icy Sea');

  final String label;

  /// The [PieceAssets] for this [PieceSet].
  // final PieceAssets assets;

  const PieceSet(this.label);

  // static const PieceAssets icySeaAssets = IMapConst({
  //   PieceKind.blackRook: AssetImage('assets/piece_sets/icy_sea/br.png'),
  //   PieceKind.blackPawn: Image.asset('assets/piece_sets/icy_sea/bp.png'),
  //   PieceKind.blackKnight: Image.asset('assets/piece_sets/icy_sea/bn.png'),
  //   PieceKind.blackBishop: Image.asset('assets/piece_sets/icy_sea/bb.png'),
  //   PieceKind.blackQueen: Image.asset('assets/piece_sets/icy_sea/bq.png'),
  //   PieceKind.blackKing: Image.asset('assets/piece_sets/icy_sea/bk.png'),
  //   PieceKind.blackDog: Image.asset('assets/piece_sets/icy_sea/wd.png'),
  //   PieceKind.blackEnragedDog: Image.asset('assets/piece_sets/icy_sea/wc.png'),
  //   PieceKind.blackSoldier: Image.asset('assets/piece_sets/icy_sea/ws.png'),
  //   PieceKind.blackEliteSoldier:
  //       Image.asset('assets/piece_sets/icy_sea/we.png'),
  //   PieceKind.blackDynamite: Image.asset('assets/piece_sets/icy_sea/wy.png'),
  //   PieceKind.blackPhantom: Image.asset('assets/piece_sets/icy_sea/wf.png'),
  //   PieceKind.blackGrapple: Image.asset('assets/piece_sets/icy_sea/wg.png'),
  //   PieceKind.whiteRook: Image.asset('assets/piece_sets/icy_sea/wr.png'),
  //   PieceKind.whitePawn: Image.asset('assets/piece_sets/icy_sea/wp.png'),
  //   PieceKind.whiteKnight: Image.asset('assets/piece_sets/icy_sea/wn.png'),
  //   PieceKind.whiteBishop: Image.asset('assets/piece_sets/icy_sea/wb.png'),
  //   PieceKind.whiteQueen: Image.asset('assets/piece_sets/icy_sea/wq.png'),
  //   PieceKind.whiteKing: Image.asset('assets/piece_sets/icy_sea/wk.png'),
  //   PieceKind.whiteDog: Image.asset('assets/piece_sets/icy_sea/wd.png'),
  //   PieceKind.whiteEnragedDog: Image.asset('assets/piece_sets/icy_sea/wc.png'),
  //   PieceKind.whiteSoldier: Image.asset('assets/piece_sets/icy_sea/ws.png'),
  //   PieceKind.whiteEliteSoldier:
  //       Image.asset('assets/piece_sets/icy_sea/we.png'),
  //   PieceKind.whiteDynamite: Image.asset('assets/piece_sets/icy_sea/wy.png'),
  //   PieceKind.whitePhantom: Image.asset('assets/piece_sets/icy_sea/wf.png'),
  //   PieceKind.whiteGrapple: Image.asset('assets/piece_sets/icy_sea/wg.png'),
  // });

  static const PieceAssets icySeaAssets = IMapConst({
    PieceKind.blackRook: AssetImage('assets/piece_sets/icy_sea/br.png'),
    PieceKind.blackPawn: AssetImage('assets/piece_sets/icy_sea/bp.png'),
    PieceKind.blackKnight: AssetImage('assets/piece_sets/icy_sea/bn.png'),
    PieceKind.blackBishop: AssetImage('assets/piece_sets/icy_sea/bb.png'),
    PieceKind.blackQueen: AssetImage('assets/piece_sets/icy_sea/bq.png'),
    PieceKind.blackKing: AssetImage('assets/piece_sets/icy_sea/bk.png'),
    PieceKind.blackDog: AssetImage('assets/piece_sets/icy_sea/bd.png'),
    PieceKind.blackEnragedDog: AssetImage('assets/piece_sets/icy_sea/bc.png'),
    PieceKind.blackSoldier: AssetImage('assets/piece_sets/icy_sea/bs.png'),
    PieceKind.blackEliteSoldier: AssetImage('assets/piece_sets/icy_sea/be.png'),
    PieceKind.blackDynamite: AssetImage('assets/piece_sets/icy_sea/by.png'),
    PieceKind.blackPhantom: AssetImage('assets/piece_sets/icy_sea/bf.png'),
    PieceKind.blackGrapple: AssetImage('assets/piece_sets/icy_sea/bg.png'),
    PieceKind.whiteRook: AssetImage('assets/piece_sets/icy_sea/wr.png'),
    PieceKind.whitePawn: AssetImage('assets/piece_sets/icy_sea/wp.png'),
    PieceKind.whiteKnight: AssetImage('assets/piece_sets/icy_sea/wn.png'),
    PieceKind.whiteBishop: AssetImage('assets/piece_sets/icy_sea/wb.png'),
    PieceKind.whiteQueen: AssetImage('assets/piece_sets/icy_sea/wq.png'),
    PieceKind.whiteKing: AssetImage('assets/piece_sets/icy_sea/wk.png'),
    PieceKind.whiteDog: AssetImage('assets/piece_sets/icy_sea/wd.png'),
    PieceKind.whiteEnragedDog: AssetImage('assets/piece_sets/icy_sea/wc.png'),
    PieceKind.whiteSoldier: AssetImage('assets/piece_sets/icy_sea/ws.png'),
    PieceKind.whiteEliteSoldier: AssetImage('assets/piece_sets/icy_sea/we.png'),
    PieceKind.whiteDynamite: AssetImage('assets/piece_sets/icy_sea/wy.png'),
    PieceKind.whitePhantom: AssetImage('assets/piece_sets/icy_sea/wf.png'),
    PieceKind.whiteGrapple: AssetImage('assets/piece_sets/icy_sea/wg.png'),
  });
}
