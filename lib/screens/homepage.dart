import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("It's Tic Tac Toe"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/play");
                  },
                  icon: const Icon(
                    Icons.play_circle,
                    size: 70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
