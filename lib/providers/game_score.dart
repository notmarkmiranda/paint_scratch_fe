import 'package:flutter/material.dart';

class GameScore with ChangeNotifier {
  final List<Map> _history;
  int _historyIndex = -1;

  GameScore(Map initialState) : _history = [initialState];

  get state => hasState ? _history[_historyIndex] : null;

  bool get hasState => _history.isNotEmpty;

  void updateState(Map state) {
    _history.add(state);
    _historyIndex++;
    notifyListeners();
  }

  void jumpTo(int index) {
    _historyIndex = index;
    notifyListeners();
  }

  void undo() {
    _historyIndex--;
    notifyListeners();
  }

  void redo() {
    _historyIndex++;
    notifyListeners();
  }

  void clear() {
    _historyIndex = -1;
    _history.clear();
  }
}