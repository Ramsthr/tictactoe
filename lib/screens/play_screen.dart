import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  late List<List<String>> playboard;
  late String cuplayer;
  late String winner;
  @override
  void initState() {
    super.initState();
    intial();
  }

  void intial() {
    winner = "";
    cuplayer = "X";
    playboard = List.generate(
      3,
      (_) => List.filled(3, ""),
    );
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
          Text((winner.isEmpty)
              ? ("Current Player $cuplayer")
              : ("Winner is $winner")),
          board(),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
            onPressed: () {
              setState(() {
                intial();
              });
            },
            child: const Icon(Icons.replay),
          ),
        ],
      ),
    );
  }

  void winning(int i, int j) {
    if (playboard[i][0] == cuplayer &&
        playboard[i][1] == cuplayer &&
        playboard[i][2] == cuplayer) {
      winner = cuplayer;
    }
    if (playboard[0][j] == cuplayer &&
        playboard[1][j] == cuplayer &&
        playboard[2][j] == cuplayer) {
      winner = cuplayer;
    }
    if (playboard[0][0] == cuplayer &&
        playboard[1][1] == cuplayer &&
        playboard[2][2] == cuplayer) {
      winner = cuplayer;
    }
    if (playboard[0][2] == cuplayer &&
        playboard[1][1] == cuplayer &&
        playboard[2][0] == cuplayer) {
      winner = cuplayer;
    }
  }

  void move(int i, int j) {
    if (playboard[i][j].isEmpty && winner.isEmpty) {
      setState(() {
        playboard[i][j] = cuplayer;
        winning(i, j);
        cuplayer = (cuplayer == "X") ? "O" : "X";
      });
    }
  }

  Widget buildstext(int i, int j) {
    return GestureDetector(
      onTap: () {
        move(i, j);
      },
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(playboard[i][j]),
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


// Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         produce(),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 10.0),
//                           child: Container(
//                             height: 30.0,
//                             width: 2.0,
//                             color: Colors.black,
//                           ),
//                         ),
//                         Text("data"),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 10.0),
//                           child: Container(
//                             height: 30.0,
//                             width: 2.0,
//                             color: Colors.black,
//                           ),
//                         ),
//                         Text("data"),
//                       ],
//                     ),
//                     Divider(
//                       color: Colors.black,
//                       thickness: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("data"),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 10.0),
//                           child: Container(
//                             height: 30.0,
//                             width: 2.0,
//                             color: Colors.black,
//                           ),
//                         ),
//                         Text("data"),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 10.0),
//                           child: Container(
//                             height: 30.0,
//                             width: 2.0,
//                             color: Colors.black,
//                           ),
//                         ),
//                         Text("data"),
//                       ],
//                     ),
//                     Divider(
//                       color: Colors.black,
//                       thickness: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("data"),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 10.0),
//                           child: Container(
//                             height: 30.0,
//                             width: 2.0,
//                             color: Colors.black,
//                           ),
//                         ),
//                         Text("data"),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 10.0),
//                           child: Container(
//                             height: 30.0,
//                             width: 2.0,
//                             color: Colors.black,
//                           ),
//                         ),
//                         Text("data"),
//                       ],
//                     ),
//                   ],