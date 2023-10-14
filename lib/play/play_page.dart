import 'package:flutter/material.dart';
import 'package:iratus/iratus_widgets/board_widget.dart';
import 'package:iratus/iratus_widgets/models.dart';
import 'package:iratus_game/iratus_game.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.shadow,
        title: const Center(
            child: Text(
          'Iratus',
          style: TextStyle(
              fontFamily: 'PierceRoman', fontSize: 30, color: Colors.white),
        )),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BoardWidget(
                game: IratusGame(),
                interactableSide: InteractableSide.both,
                orientation: Side.black,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
