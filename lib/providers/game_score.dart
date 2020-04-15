import 'package:flutter/material.dart';

class GameScore with ChangeNotifier {
  List<Map> _history;
  int _historyIndex = 0;
  static Map<String, dynamic> baseState = {
    'cHalf': 'top',
    'cInning': 1,
    'inningTop': true,
    'cOuts': 0,
    'cFouls': 0,
    'cStrikes': 0,
    'cBalls': 0,
    'aRuns': 0,
    'hRuns': 0,
  };

  GameScore(Map initialState)
      : _history = [
          {...initialState, ...baseState}
        ];

  get state => hasState ? _history[_historyIndex] : null;

  bool get hasState => _history.isNotEmpty;

  void updateState(Map state) {
    if (_historyIndex != (_history.length - 1)) {
      _history = _history.sublist(0, (_historyIndex + 1));
    }
    _historyIndex++;
    _history.add(state);
    notifyListeners();
  }

  void jumpTo(int index) {
    _historyIndex = index;
    notifyListeners();
  }

  void undo() {
    if (_historyIndex > 0) {
      _historyIndex--;
      notifyListeners();
    }
  }

  void redo() {
    int stateLength = _history.length - 1;
    if (_historyIndex < stateLength) {
      _historyIndex++;
      notifyListeners();
    }
  }

  void clear() {
    _historyIndex = -1;
    _history.clear();
  }

  void ball() {
    int cBalls = state['cBalls'];
    int newBalls = cBalls + 1;
    if (newBalls >= state['ballsPerWalk']) {
      resetCount();
    } else {
      Map newState = Map.from(state);
      newState['cBalls'] = newBalls;
      updateState(newState);
    }
  }

  void strike() {
    int cStrikes = state['cStrikes'];
    int newStrikes = cStrikes + 1;

    if (state['combineFoulsStrikes'] == true) {
      int foulsStrikes = state['cFouls'] + newStrikes;
      foulsStrikes >= state['foulsStrikesPerOut']
          ? resetCount(incrementOut: true)
          : _increaseStat(Map.from(state), newStrikes, 'cStrikes');
    } else {
      newStrikes >= 3
          ? resetCount(incrementOut: true)
          : _increaseStat(Map.from(state), newStrikes, 'cStrikes');
    }
  }

  void foul() {
    int cFouls = state['cFouls'];
    int newFouls = cFouls + 1;

    if (state['combineFoulsStrikes'] == true) {
      int foulsStrikes = state['cStrikes'] + newFouls;
      foulsStrikes >= state['foulsStrikesPerOut']
          ? resetCount(incrementOut: true)
          : _increaseStat(Map.from(state), newFouls, 'cFouls');
    } else {
      newFouls >= state['foulsPerOut']
          ? resetCount(incrementOut: true)
          : _increaseStat(Map.from(state), newFouls, 'cFouls');
    }
  }

  void _increaseStat(Map newState, int newStatistic, String identifier) {
    newState[identifier] = newStatistic;
    updateState(newState);
  }

  void resetCount({Map incState = null, bool incrementOut = false}) {
    print(incState);
    Map newState = incState ?? Map.from(state);
//    Map newState = Map.from(state);
    newState['cBalls'] = 0;
    newState['cStrikes'] = 0;
    newState['cFouls'] = 0;

    if (incrementOut == true) {
      int newOuts = state['cOuts'] + 1;
      if (newOuts >= 3) {
        int newInning = state['cInning'] + 1;
        if (_bottomOfInning()) {
          newState['cInning'] = newInning;
        }
        newState['inningTop'] = !state['inningTop'];
        newState['cOuts'] = 0;
      } else {
        newState['cOuts'] = newOuts;
      }
    }
    updateState(newState);
  }

  void scoreRun() {
    Map newState = Map.from(state);
    int newRuns;
    if (state['inningTop']) {
      newRuns = state['aRuns'] + 1;
      newState['aRuns'] = newRuns;
    } else {
      newRuns = state['hRuns'] + 1;
      newState['hRuns'] = newRuns;
    }
    resetCount(incState: newState);
  }

  bool _bottomOfInning() {
    return state['inningTop'] != true;
  }
}
