import 'package:flutter/material.dart';

import 'package:paint_scratch_fe/config/colors.dart';

class LabelAndForm extends StatelessWidget {
  final String hintText;
  final TextInputAction textInputAction;
  final Function onEditingComplete;
  final FocusNode focusNode;

  LabelAndForm({
    @required this.hintText,
    this.textInputAction,
    this.onEditingComplete,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 5),
            child: TextField(
              onChanged: (text) {print(text);},
              textInputAction: textInputAction,
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