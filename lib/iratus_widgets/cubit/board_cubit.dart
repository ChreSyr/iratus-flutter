import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iratus/iratus_widgets/cubit/board_state.dart';
import 'package:iratus_game/iratus_game.dart';

class BoardCubit extends Cubit<BoardState> {
  BoardCubit({
    required IratusGame game,
    required Side orientation,
  }) : super(BoardState(
          game: game,
          orientation: orientation,
        ));
}
