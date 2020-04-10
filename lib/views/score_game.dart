import 'package:flutter/material.dart';
import 'package:paint_scratch_fe/config/colors.dart';

class ScoreGame extends StatelessWidget {
  final String awayTeam;
  final String homeTeam;

  ScoreGame({this.awayTeam, this.homeTeam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Top 5th',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 25, bottom: 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(awayTeam),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 8.0,
                              left: 8.0,
                              bottom: 8.0,
                              right: 14.0,
                            ),
                            child: Text(
                              '12',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 8.0,
                              left: 14.0,
                              bottom: 8.0,
                              right: 8.0,
                            ),
                            child: Text(
                              '7',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(homeTeam),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                height: 25,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  child: Text('Edit Score')
                )
              ),
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 3),
                            child: Text(
                              'B',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            width: 11,
                            height: 11,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.red)
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            width: 11,
                            height: 11,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.red)
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            width: 11,
                            height: 11,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1)
                            )
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            width: 11,
                            height: 11,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1)
                            )
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 3),
                            child: Text(
                              'S/F',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            width: 11,
                            height: 11,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.red)
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            width: 11,
                            height: 11,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1)
                            )
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            width: 11,
                            height: 11,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1)
                            )
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 3),
                            child: Text(
                              'O',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            width: 11,
                            height: 11,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.red)
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            width: 11,
                            height: 11,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.red)
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(1),
                            width: 11,
                            height: 11,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1)
                            )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
