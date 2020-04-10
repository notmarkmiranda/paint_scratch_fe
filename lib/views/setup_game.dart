import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:paint_scratch_fe/providers/game_information.dart';
import 'package:paint_scratch_fe/views/score_game.dart';
import 'package:paint_scratch_fe/widgets/label_and_form.dart';
import 'package:paint_scratch_fe/widgets/label_and_count.dart';
import 'package:paint_scratch_fe/config/colors.dart';


class SetupGame extends StatefulWidget {
  @override
  _SetupGameState createState() => _SetupGameState();
}

class _SetupGameState extends State<SetupGame> {
  FocusNode _homeTeamFocusNode;
  FocusNode _gameTimeInMinutesNode;
  bool _combineFoulsStrikes;

  @override
  void initState() {
    super.initState();
    _homeTeamFocusNode = FocusNode();
    _gameTimeInMinutesNode = FocusNode();
    _combineFoulsStrikes = true;
  }

  @override
  Widget build(BuildContext context) {
    final gameInformation = Provider.of<GameInformation>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Text(
                'SETUP GAME',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: AppColors.fontPrimary,
                )
              )
            ),
            LabelAndForm(
              hintText: 'Away Team',
              teamKey: 'awayTeam',
              textInputAction: TextInputAction.next,
              onEditingComplete: () => _homeTeamFocusNode.requestFocus(),
            ),
            LabelAndForm(
              hintText: 'Home Team',
              teamKey: 'homeTeam',
              focusNode: _homeTeamFocusNode,
              textInputAction: TextInputAction.next,
              onEditingComplete: () => _gameTimeInMinutesNode.requestFocus(),
            ),
            LabelAndForm(
              hintText: 'Game Time In Minutes',
              teamKey: 'gameTimeInMinutes',
              focusNode: _gameTimeInMinutesNode,
              keyboardType: TextInputType.number,
            ),
            LabelAndCount(
              counterKey: 'numberOfInnings',
              labelText: 'Number Of Innings',
              topMargin: 25
            ),
            LabelAndCount(
              counterKey: 'outsPerInning',
              labelText: 'Outs Per Inning',
              topMargin: 15
            ),
            Container(
              padding: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: _combineFoulsStrikes,
                    onChanged: (newValue) { setState(() {
                      _combineFoulsStrikes = newValue;
                    }); },
                    checkColor: AppColors.highlightPrimary,
                  ),
                  Text(
                    'Fouls & Strikes Combined?',
                    style: TextStyle(
                      color: AppColors.fontPrimary,
                      fontSize: 18
                    )
                  )
                ],
              ),
            ),
            if (_combineFoulsStrikes == true)
              LabelAndCount(
                counterKey: 'foulsStrikesPerOut',
                labelText: 'Fouls & Strikes Per Out',
                topMargin: 15
              ),
            if (_combineFoulsStrikes == false)
                  LabelAndCount(
                    counterKey: 'foulsPerOut',
                    labelText: 'Fouls Per Out',
                    topMargin: 15,
                  ),
            LabelAndCount(
              counterKey: 'ballsPerWalk',
              labelText: 'Balls Per Walk',
              topMargin: 15,
            ),

            Container(
              padding: (EdgeInsets.only(top: 25)),
              child: FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScoreGame(
                        awayTeam: gameInformation.teamNames['awayTeam'],
                        homeTeam: gameInformation.teamNames['homeTeam']
                      )
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(0),
                  )
                ),
                child: Text(
                  "LET'S GO!",
                  style: TextStyle(color: AppColors.background)
                ),
                color: AppColors.highlightPrimary,
              ),
            )

          ],
        ),
      ),
    );
  }
}
