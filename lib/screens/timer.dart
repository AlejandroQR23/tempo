import 'package:flutter/material.dart';
import 'package:tempo/screens/app_group.dart';
import 'package:tempo/screens/labels.dart';

class Timer extends StatelessWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Timer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Timer', style: TextStyle(fontSize: 24)),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const AppGroup(),
                      ),
                    );
                  },
                  child: const Text('App Groups'),
                ),
                SizedBox(width: 16),
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const Labels(),
                      ),
                    );
                  },
                  child: const Text('Labels'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
