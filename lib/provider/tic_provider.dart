import 'dart:math';

import 'package:flutter/material.dart';

class TicProvider with ChangeNotifier {
  List<List<String>> _board = List.generate(3, (_) => List.filled(3, ""));
  String _player = "X";
  String _winner = "";

  List<List<String>> get playboard => _board;
  String get cuplayer => _player;
  String get winner => _winner;

  void initialize() {
    _board = List.generate(3, (_) => List.filled(3, ""));
    _player = "X";
    _winner = "";
    notifyListeners();
  }

  void movebot() {
    if (_winner.isEmpty) {
      Random x = Random();
      int i = x.nextInt(3);
      int j = x.nextInt(3);
      while (_board[i][j].isNotEmpty) {
        i = x.nextInt(3);
        j = x.nextInt(3);
      }
      _board[i][j] = _player;
      winning(i, j);
      _player = (_player == "X") ? "O" : "X";
      notifyListeners();
    }
  }

  void winning(int i, int j) {
    if (_board[i][0] == _player &&
        _board[i][1] == _player &&
        _board[i][2] == _player) {
      _winner = _player;
    }
    if (_board[0][j] == _player &&
        _board[1][j] == _player &&
        _board[2][j] == _player) {
      _winner = _player;
    }
    if (_board[0][0] == _player &&
        _board[1][1] == _player &&
        _board[2][2] == _player) {
      _winner = _player;
    }
    if (_board[0][2] == _player &&
        _board[1][1] == _player &&
        _board[2][0] == _player) {
      _winner = _player;
    }
    notifyListeners();
  }

  void move(int i, int j) {
    if (_board[i][j].isEmpty && _winner.isEmpty) {
      _board[i][j] = _player;
      winning(i, j);
      _player = (_player == "X") ? "O" : "X";
      notifyListeners();
      movebot();
    }
  }
}
