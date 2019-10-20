
import 'dart:ui';
import 'package:langawclonepractice/langawgame.dart';

class Fly{

  final LangawGame game;
  Rect flyRect;
  Paint flyPaint;

  Fly(this.game,double xPos,double yPos){
    //initial position of our object
      flyRect = Rect.fromLTWH(xPos, yPos, game.tileSize, game.tileSize);
      flyPaint = Paint();
      flyPaint.color = Color(0xff6ab04c);
  }

  void render(Canvas canvas) {
      canvas.drawRect(flyRect, flyPaint);
  }


  void update(double t) {
  
  }

  void onTapDown(){
    
  }

}