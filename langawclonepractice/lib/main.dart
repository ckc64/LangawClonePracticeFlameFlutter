import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'langawgame.dart';

void main() async{
  //set up the device characteristic when running the game
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  LangawGame g = LangawGame();
  runApp(g.widget);
}
