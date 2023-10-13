import 'package:flutter/material.dart';
import 'package:iratus/l10n/l10n.dart';

class GameResultWidget extends StatelessWidget {
  const GameResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 0, 0, .5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FilledButton.icon(
            onPressed: () => {},
            icon: const Icon(Icons.emoji_people),
            label: Text(context.l10n.play_locally),
          ),
          const SizedBox(height: 10),
          FilledButton.icon(
            onPressed: () => {},
            icon: const Icon(Icons.smart_toy_outlined),
            label: Text(context.l10n.play_ai),
          ),
        ],
      ),
    );
  }
}

class PlayerInfoWidget extends StatelessWidget {
  const PlayerInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 100,
    );
  }
}
