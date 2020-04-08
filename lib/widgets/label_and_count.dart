import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:paint_scratch_fe/providers/game_information.dart';
import 'package:paint_scratch_fe/config/colors.dart';

class LabelAndCount extends StatelessWidget {
  final String counterKey;
  final String labelText;
  final double topMargin;

  LabelAndCount({@required this.counterKey, @required this.labelText, @required this.topMargin});

  @override
  Widget build(BuildContext context) {
    final gameInformation = Provider.of<GameInformation>(context);

    return Container(
      padding: EdgeInsets.only(top: topMargin, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                labelText,
                style: TextStyle(
                  color: AppColors.fontPrimary,
                  fontSize: 18
                )
              )
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 30,
                  height: 30,
                  child: FlatButton(
                    onPressed: () { gameInformation.decrement(counterKey); },
                    child: Text(
                      '-',
                      style: TextStyle(
                        color: AppColors.fontPrimary,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    color: AppColors.highlightSecondary,
                  ),
                ),
                Container(
                  alignment: Alignment(0, 0),
                  width: 50,
                  height: 30,
                  child: Text(
                    '${gameInformation.counterVariables[counterKey]}',
                    style: TextStyle(
                      color: AppColors.fontPrimary,
                      fontSize: 18
                    ),
                  )
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: FlatButton(
                    onPressed: () { gameInformation.increment(counterKey); },
                    child: Text(
                      '+',
                      style: TextStyle(
                        color: AppColors.fontPrimary,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    color: AppColors.highlightSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
