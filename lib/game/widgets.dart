import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BoardWidget extends StatefulWidget {
  const BoardWidget({super.key});

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
    final AppLocalizations currentLanguage = AppLocalizations.of(context)!;

    return Container(
      color: const Color.fromRGBO(0, 0, 0, .5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FilledButton.tonalIcon(
            onPressed: () => {},
            icon: const Icon(Icons.emoji_people),
            label: Text(currentLanguage.play_locally),
          ),
          const SizedBox(height: 10),
          FilledButton.tonalIcon(
            onPressed: () => {},
            icon: const Icon(Icons.smart_toy_outlined),
            label: Text(currentLanguage.play_ai),
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
