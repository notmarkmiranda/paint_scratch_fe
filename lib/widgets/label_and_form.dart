import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:paint_scratch_fe/config/colors.dart';
import 'package:paint_scratch_fe/providers/game_information.dart';


class LabelAndForm extends StatelessWidget {
  final String hintText;
  final TextInputAction textInputAction;
  final Function onEditingComplete;
  final FocusNode focusNode;
  final String teamKey;
  final TextInputType keyboardType;

  LabelAndForm({
    @required this.hintText,
    @required this.teamKey,
    this.textInputAction,
    this.onEditingComplete,
    this.focusNode,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final gameInformation = Provider.of<GameInformation>(context);

    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 5),
            child: TextField(
              keyboardType: keyboardType,
              textCapitalization: TextCapitalization.words,
              textInputAction: textInputAction,
              onChanged: (team) {
                gameInformation.setTeam(teamKey, team);
              },
              onEditingComplete: onEditingComplete,
              focusNode: focusNode,
              style: TextStyle(color: AppColors.fontPrimary),
              autofocus: true,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    color: AppColors.highlightPrimary,
                    width: 2
                  )
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                fillColor: Colors.white,
                contentPadding: EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                labelText: hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}