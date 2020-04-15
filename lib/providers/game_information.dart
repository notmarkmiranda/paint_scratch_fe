import 'package:flutter/foundation.dart';

class GameInformation with ChangeNotifier {
  Map<String, dynamic> counterVariables = {
    'numberOfInnings': 5,
    'outsPerInning': 3,
    'foulsStrikesPerOut': 4,
    'ballsPerWalk': 4,
    'foulsPerOut': 4,
    'combineFoulsStrikes': true,
    'gameTimeInMinutes': 50
  };

  Map<String, String> teamNames = {
    'awayTeam': 'Away Team',
    'homeTeam': 'Home Team',
  };

  void increment(String key) {
    counterVariables[key]++;
    notifyListeners();
  }

  void decrement(String key) {
    if (counterVariables[key] > 1) { counterVariables[key]--; }
    notifyListeners();
  }

  void setTeam(String key, String teamName) {
    teamNames[key] = teamName;
    print(teamNames);
    notifyListeners();
  }

  void combineFoulsStrikes(bool newValue) {
    counterVariables['combineFoulsStrikes'] = newValue;
    notifyListeners();
  }
}