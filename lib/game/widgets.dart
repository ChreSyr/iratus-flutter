import 'package:flutter/material.dart';
import 'package:iratus/game/board.dart';

class BoardWidget extends StatefulWidget {
  final Board board;

  const BoardWidget(this.board, {super.key});

  @override
  State<BoardWidget> createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 8 / 10,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset('assets/iratusboard-small.jpg'),
          const GameResultWidget(),
        ],
      ),
    );
  }
}

class GameResultWidget extends StatefulWidget {
  const GameResultWidget({super.key});

  @override
  State<GameResultWidget> createState() => _GameResultWidgetState();
}

class _GameResultWidgetState extends State<GameResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 0, 0, .5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FilledButton.tonalIcon(
            onPressed: () => {},
            icon: const Icon(Icons.emoji_people),
            label: const Text('Play with a local friend'),
          ),
          const SizedBox(height: 10),
          FilledButton.tonalIcon(
            onPressed: () => {},
            icon: const Icon(Icons.smart_toy_outlined),
            label: const Text('Play with a dumb AI'),
          ),
        ],
      ),
    );
  }
}

//

class PlayerInfoWidget extends StatefulWidget {
  const PlayerInfoWidget({super.key});

  @override
  State<PlayerInfoWidget> createState() => _PlayerInfoWidgetState();
}

class _PlayerInfoWidgetState extends State<PlayerInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 100,
    );
  }
}
