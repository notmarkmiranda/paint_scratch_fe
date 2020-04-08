import 'package:flutter/material.dart';

import 'package:paint_scratch_fe/config/colors.dart';
import 'package:paint_scratch_fe/providers/counter.dart';
import 'package:paint_scratch_fe/views/setup_game.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paint Scratch',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ChangeNotifierProvider<Counter>(
          builder: (context) => Counter(),
          child: SetupGame()
        )
      ),
    );
  }
}
