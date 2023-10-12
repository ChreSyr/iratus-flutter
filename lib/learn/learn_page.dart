import 'package:chessground/chessground.dart' as cg;
import 'package:flutter/material.dart';
import 'package:iratus/l10n/l10n.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  int _counter = 0;
  increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.shadow,
        title: Center(
            child: Text(context.l10n.learn_center,
                style: const TextStyle(
                  fontFamily: 'PierceRoman',
                  fontSize: 30,
                  color: Colors.white,
                ))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Learn the rules here'),
            Text('You have pushed the button $_counter times.'),
            if (_counter > 0)
              IconButton(
                onPressed: resetCounter,
                icon: const Icon(Icons.replay),
              ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PopUp(argument: 'Random text');
                }));
              },
              child: const Text('Pop Up'),
            ),
            cg.Board(
              size: MediaQuery.of(context).size.width,
              // settings: BoardSettings(
              //   pieceAssets: pieceSet.assets,
              //   colorScheme: boardTheme.colors,
              //   enableCoordinates: true,
              // ),
              // data: cg.BoardData(
              //   interactableSide: (position.turn == dc.Side.white
              //           ? cg.InteractableSide.white
              //           : cg.InteractableSide.black),
              //   validMoves: validMoves,
              //   orientation: orientation,
              //   fen: fen,
              //   lastMove: lastMove,
              //   sideToMove:
              //       position.turn == dc.Side.white ? Side.white : Side.black,
              //   isCheck: position.isCheck,
              //   premove: premove,
              // ),
              data: const cg.BoardData(
                interactableSide: cg.InteractableSide.white,
                orientation: cg.Side.white,
                fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR',
              ),
              // onMove: playMode == Mode.botPlay
              //     ? _onUserMoveAgainstBot
              //     : _onUserMoveFreePlay,
              // onPremove: _onSetPremove,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increaseCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PopUp extends StatelessWidget {
  const PopUp({super.key, required this.argument});

  final String argument;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(argument),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}
