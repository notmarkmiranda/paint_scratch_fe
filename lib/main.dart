import 'package:flutter/material.dart';

import 'package:paint_scratch_fe/config/colors.dart';
import 'package:paint_scratch_fe/providers/game_information.dart';
import 'package:paint_scratch_fe/views/setup_game.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (_) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Paint Scratch',
        theme: ThemeData(),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
          child: ChangeNotifierProvider<GameInformation>(
              create: (context) => GameInformation(), child: SetupGame())),
    );
  }
}
