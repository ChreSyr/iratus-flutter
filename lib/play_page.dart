import 'package:flutter/material.dart';
import 'package:iratus/game/board.dart';
import 'package:iratus/game/widgets.dart';

Board board = IratusBoard(0, 10, 8);

class PlayPage extends StatefulWidget {
  const PlayPage({super.key});

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
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
        child: FractionallySizedBox(
          widthFactor: 0.95, // 90% of the parent width
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const PlayerInfoWidget(),
                const SizedBox(height: 10),
                BoardWidget(board),
                const SizedBox(height: 10),
                const PlayerInfoWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
