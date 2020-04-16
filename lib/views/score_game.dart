import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:humanize/humanize.dart' as humanize;

import 'package:paint_scratch_fe/config/colors.dart';
import 'package:paint_scratch_fe/providers/game_score.dart';
import 'package:paint_scratch_fe/widgets/gradient_raised_button.dart';

import '../main.dart';

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
                  bottom: BorderSide(
                    width: 1,
                    color: AppColors.backgroundSecondary,
                  ),
                ),
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
                height: 55,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 30.0,
                      spreadRadius: 20.0,
                      offset: Offset(10, 10),
                    )
                  ],
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color(0xFFAAAAAA),
                    ),
                  ),
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
                                  width: 1,
                                  color: Color(0xFFAAAAAA),
                                ),
                                right: BorderSide(
                                  width: 1,
                                  color: Color(0xFFAAAAAA),
                                ),
                              ),
                            ),
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
                                  width: 1,
                                  color: Color(0xFFAAAAAA),
                                ),
                              ),
                            ),
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
            // EDIT & RESET BUTTONS
            Container(
              height: 60,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GradientRaisedButton(
                      buttonText: 'NEW GAME',
                      firstColor: Colors.white,
                      secondColor: Colors.white,
                      textColor: Colors.red[900],
                      borderColor: Colors.red[900],
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyApp(),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: GradientRaisedButton(
                      buttonText: 'EDIT COUNT',
                      firstColor: Colors.grey[100],
                      secondColor: Colors.grey[100],
                      textColor: Colors.black,
                      onPressed: () {
                        showSimpleCustomDialog(context, gameScore);
                      },
                    ),
                  ),
                  Expanded(
                    child: GradientRaisedButton(
                      buttonText: 'EDIT SCORE',
                      firstColor: Colors.grey[100],
                      secondColor: Colors.grey[100],
                      textColor: Colors.black,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            // MIDDLE SECTION
            Expanded(
              child: Center(
                child: Container(child: Text('Stats / Lineups Coming Soon...')),
              ),
            ),
            // UNDO / REDO
            Container(
                height: 50,
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
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      bottomLeft: Radius.circular(8.0),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(0.0),
                                  onPressed: () {
                                    gameScore.undo();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        bottomLeft: Radius.circular(8.0),
                                      ),
                                    ),
                                    constraints: BoxConstraints(
                                        maxWidth: 300.0, minHeight: 50.0),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.undo,
                                      color: AppColors.background,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    gameScore.redo();
                                  },
                                  padding: EdgeInsets.all(0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                      ),
                                    ),
                                    constraints: BoxConstraints(
                                        maxWidth: 300.0, minHeight: 50.0),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.redo,
                                      color: AppColors.background,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
                height: 100,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                          child: GradientRaisedButton(
                        buttonText: 'IN PLAY',
                        firstColor: Colors.white10,
                        secondColor: Colors.white10,
                        onPressed: () {
                          gameScore.resetCount();
                        },
                      )),
                      Expanded(
                          child: GradientRaisedButton(
                        buttonText: 'RUN SCORED',
                        firstColor: Colors.white10,
                        secondColor: Colors.white10,
                        onPressed: () {
                          gameScore.scoreRun();
                        },
                      )),
                      Expanded(
                          child: GradientRaisedButton(
                        buttonText: 'OUT',
                        firstColor: Colors.white10,
                        secondColor: Colors.white10,
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
                height: 100,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                          child: GradientRaisedButton(
                        buttonText: 'BALL',
                        firstColor: Colors.blueGrey,
                        secondColor: Colors.blueGrey,
                        textColor: Colors.white,
                        onPressed: () {
                          gameScore.ball();
                        },
                      )),
                      Expanded(
                          child: GradientRaisedButton(
                        buttonText: 'STRIKE',
                        firstColor: Colors.blueGrey,
                        secondColor: Colors.blueGrey,
                        textColor: Colors.white,
                        onPressed: () {
                          gameScore.strike();
                        },
                      )),
                      Expanded(
                        child: GradientRaisedButton(
                          buttonText: 'FOUL',
                          firstColor: Colors.blueGrey,
                          secondColor: Colors.blueGrey,
                          textColor: Colors.white,
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

  void showSimpleCustomDialog(BuildContext context, GameScore gameScore) {
    int foulsStrikes = gameScore.state['cFouls'] + gameScore.state['cStrikes'];
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 300.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 10),
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
                          Text(
                            gameScore.state['cInning'].toString(),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                          Container(
                            width: 40,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    border: Border.all(
                                      width: 1.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: FlatButton(
                                    child: Text(
                                      '+',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    gameScore.state['cBalls'].toString(),
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    border: Border.all(
                                      width: 1.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: FlatButton(
                                    child: Text(
                                      '-',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
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
                            padding: EdgeInsets.all(8.0),
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
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Okay',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel!',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
  }
}
