import 'package:flutter/material.dart';

class ScoreGame extends StatelessWidget {
  final String awayTeam;
  final String homeTeam;

  ScoreGame({this.awayTeam, this.homeTeam});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Home Team: $homeTeam'),
    );
  }
}
