
import 'dart:ui';
import 'package:langawclonepractice/langawgame.dart';

class Fly{

  final LangawGame game;
  Rect flyRect;

  Fly(this.game,double xPos,double yPos){
    //initial position of our object
      flyRect = Rect.fromLTWH(xPos, yPos, game.tileSize, game.tileSize);
  }

  void render(Canvas canvas) {
    
  }


  void update(double t) {
  
  }

}