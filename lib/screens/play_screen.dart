import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic/provider/tic_provider.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.home,
              size: 40,
            ),
          ),
          Text((context.read<TicProvider>().winner.isEmpty)
              ? ("Current Player ${context.watch<TicProvider>().cuplayer}")
              : ("Winner is ${context.watch<TicProvider>().winner}")),
          board(),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
            onPressed: () {
              context.read<TicProvider>().initialize();
            },
            child: const Icon(Icons.replay),
          ),
        ],
      ),
    );
  }

  Widget buildstext(int i, int j) {
    return GestureDetector(
      onTap: () {
        context.read<TicProvider>().move(i, j);
      },
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(context.watch<TicProvider>().playboard[i][j]),
        ),
      ),
    );
  }

  Widget board() {
    List<Row> ls = [];
    for (int i = 0; i < 3; i++) {
      List<Widget> adc = [];
      for (int j = 0; j < 3; j++) {
        adc.add(buildstext(i, j));
      }
      ls.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: adc,
        ),
      );
    }
    return Column(
      children: ls,
    );
  }
}
