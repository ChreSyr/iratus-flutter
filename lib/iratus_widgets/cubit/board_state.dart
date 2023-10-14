import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iratus_game/iratus_game.dart';

part 'board_state.freezed.dart';

@freezed
class BoardState with _$BoardState {
  factory BoardState({
    required IratusGame game,
    required Side orientation,
  }) = _BoardState;
}
