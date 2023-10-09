import 'package:chessground/chessground.dart' as cg;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final AppLocalizations currentLanguage = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.shadow,
        title: Center(
            child: Text(currentLanguage.learn_center,
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
            const cg.Board(
              size: 380,
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
              data: cg.BoardData(
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

class PopUp extends StatefulWidget {
  const PopUp({super.key, required this.argument});

  final String argument;

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.argument),
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
