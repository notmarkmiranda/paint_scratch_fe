import 'package:flutter/material.dart';

import 'package:paint_scratch_fe/widgets/label_and_form.dart';
import 'package:paint_scratch_fe/widgets/label_and_count.dart';
import 'package:paint_scratch_fe/config/colors.dart';

class SetupGame extends StatefulWidget {
  @override
  _SetupGameState createState() => _SetupGameState();
}

class _SetupGameState extends State<SetupGame> {
  FocusNode _homeTeamFocusNode;
  bool _checkboxValue;

  @override
  void initState() {
    super.initState();
    _homeTeamFocusNode = FocusNode();
    _checkboxValue = true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
            textInputAction: TextInputAction.next,
            onEditingComplete: () => _homeTeamFocusNode.requestFocus(),
          ),
          LabelAndForm(
            hintText: 'Home Team',
            focusNode: _homeTeamFocusNode,
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
                  value: _checkboxValue,
                  onChanged: (newValue) { setState(() {
                    _checkboxValue = newValue;
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
          if (_checkboxValue == false)
            Text('super'),
          LabelAndCount(
            counterKey: 'foulsStrikesPerOut',
            labelText: 'Fouls & Strikes Per Out',
            topMargin: 15
          ),
          LabelAndCount(
            counterKey: 'ballsPerWalk',
            labelText: 'Balls Per Walk',
            topMargin: 15,
          ),

          Container(
            padding: (EdgeInsets.only(top: 25, left: 20, right: 20)),
            child: FlatButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(0),
                )
              ),
              child: Text(
                "LET'S GO!",
                style: TextStyle(color: AppColors.fontPrimary)
              ),
              color: AppColors.highlightPrimary,
            ),
          )

        ],
      ),
    );
  }
}
