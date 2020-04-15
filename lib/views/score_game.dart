import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:humanize/humanize.dart' as humanize;

import 'package:paint_scratch_fe/config/colors.dart';
import 'package:paint_scratch_fe/providers/game_score.dart';
import 'package:paint_scratch_fe/widgets/gradient_raised_button.dart';

class ScoreGame extends StatelessWidget {
  final String awayTeam;
  final String homeTeam;

  ScoreGame({this.awayTeam, this.homeTeam});

  IconData topOrBottomInning(bool topState) {
    return topState ? Icons.arrow_drop_up : Icons.arrow_drop_down;
  }

  @override
  Widget build(BuildContext context) {
    final gameScore = Provider.of<GameScore>(context);
    int foulsStrikes = gameScore.state['cFouls'] + gameScore.state['cStrikes'];
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // INNING & COUNT
            Container(
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 0.5, color: Color(0xFFAAAAAA))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        if (gameScore.state['inningTop'])
                          Icon(Icons.arrow_drop_up),
                        if (gameScore.state['inningTop'] == false)
                          Icon(Icons.arrow_drop_down),
                        Text(gameScore.state['cInning'].toString(),
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'B ',
                        ),
                        Text(gameScore.state['cBalls'].toString(),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                  ),
                  if (gameScore.state['combineFoulsStrikes'])
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'S/F ',
                          ),
                          Text(foulsStrikes.toString(),
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ),
                  if (!gameScore.state['combineFoulsStrikes'])
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'S ',
                              ),
                              Text(gameScore.state['cStrikes'].toString(),
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'F ',
                              ),
                              Text(gameScore.state['cFouls'].toString(),
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'O ',
                        ),
                        Text(gameScore.state['cOuts'].toString(),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // TEAM & SCORES
            Container(
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: Color(0xFFAAAAAA))),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              child: Text(
                                awayTeam,
                                style: TextStyle(color: Colors.red[800]),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: gameScore.state['inningTop'] ? 1 : 0,
                            child: Container(
                              width: 10,
                              height: 10,
                              margin: EdgeInsets.only(left: 4, right: 8),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        width: 0.5, color: Color(0xFFAAAAAA)),
                                    right: BorderSide(
                                        width: 0.5, color: Color(0xFFAAAAAA)))),
                            width: 45,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(8),
                            child: Text(
                              gameScore.state['aRuns'].toString(),
                              style: TextStyle(
                                color: Colors.red[800],
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 0.5, color: Color(0xFFAAAAAA)))),
                            width: 45,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(8),
                            child: Text(
                              gameScore.state['hRuns'].toString(),
                              style: TextStyle(
                                color: Colors.blue[800],
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: gameScore.state['inningTop'] ? 0 : 1,
                            child: Container(
                              width: 10,
                              height: 10,
                              margin: EdgeInsets.only(left: 8, right: 4),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                homeTeam,
                                style: TextStyle(color: Colors.blue[800]),
                                textAlign: TextAlign.right,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            // MIDDLE SECTION
            Expanded(
              child: Center(
                child: Container(child: Text('Stats / Lineups Coming Soon...')),
              ),
            ),
            // UNDO / REDO
            Container(
                height: 40,
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Row(
                          children: <Widget>[],
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          child: Row(children: <Widget>[
                            Expanded(
                              child: Container(
                                  child: RaisedButton(
                                onPressed: () {
                                  gameScore.undo();
                                },
                                padding: EdgeInsets.all(0.0),
                                child: Container(
                                    color: Colors.black38,
                                    constraints: BoxConstraints(
                                        maxWidth: 300.0, minHeight: 50.0),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.undo,
                                      color: AppColors.background,
                                    )),
                              )),
                            ),
                            Expanded(
                              child: Container(
                                  child: RaisedButton(
                                onPressed: () {
                                  gameScore.redo();
                                },
                                padding: EdgeInsets.all(0.0),
                                child: Container(
                                    color: Colors.black45,
                                    constraints: BoxConstraints(
                                        maxWidth: 300.0, minHeight: 50.0),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.redo,
                                      color: AppColors.background,
                                    )),
                              )),
                            ),
                          ]),
                        ))
                  ],
                )),
            Container(
                height: 125,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                          child: GradientRaisedButton(
                        buttonText: 'IN PLAY',
                        firstColor: Colors.purple,
                        secondColor: Colors.purple[300],
                        onPressed: () {
                          gameScore.resetCount();
                        },
                      )),
                      Expanded(
                          child: GradientRaisedButton(
                        buttonText: 'RUN SCORED',
                        firstColor: Colors.green,
                        secondColor: Colors.green[300],
                        onPressed: () {
                          gameScore.scoreRun();
                        },
                      )),
                      Expanded(
                          child: GradientRaisedButton(
                        buttonText: 'OUT',
                        firstColor: Colors.orange,
                        secondColor: Colors.orange[300],
                        onPressed: () {
                          gameScore.resetCount(incrementOut: true);
                        },
                      )),
                    ])),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Divider(
                thickness: 2,
              ),
            ),
            Container(
                height: 125,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                          child: GradientRaisedButton(
                        buttonText: 'BALL',
                        firstColor: Colors.blue[700],
                        secondColor: Colors.blue,
                        onPressed: () {
                          gameScore.ball();
                        },
                      )),
                      Expanded(
                          child: GradientRaisedButton(
                        buttonText: 'STRIKE',
                        firstColor: Colors.red[700],
                        secondColor: Colors.red,
                        onPressed: () {
                          gameScore.strike();
                        },
                      )),
                      Expanded(
                        child: GradientRaisedButton(
                          buttonText: 'FOUL',
                          firstColor: Colors.yellow[700],
                          secondColor: Colors.yellow,
                          onPressed: () {
                            gameScore.foul();
                          },
                        ),
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}
