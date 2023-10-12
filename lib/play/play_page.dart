import 'package:flutter/material.dart';
import 'package:iratus/iratus_widgets/widgets.dart';

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
      body: const Center(
        child: FractionallySizedBox(
          widthFactor: 0.95, // 90% of the parent width
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PlayerInfoWidget(),
                SizedBox(height: 10),
                BoardWidget(),
                SizedBox(height: 10),
                PlayerInfoWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
