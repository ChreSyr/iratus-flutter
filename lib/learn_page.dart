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
