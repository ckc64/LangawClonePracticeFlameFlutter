
import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'components/fly.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';

class LangawGame extends Game{
  Size screenSize;
  double tileSize;
  List<Fly>flies;
  Random rnd;

  LangawGame(){
    initialize();
  }

    void initialize() async {
        flies = List<Fly>();
        rnd = Random();
        resize(await Flame.util.initialDimensions());
        spawnFly();
    }
    
    void spawnFly(){
      double randomXpos = rnd.nextDouble() * (screenSize.width - tileSize);
      double randomYpos = rnd.nextDouble() * (screenSize.height - tileSize);
      flies.add(Fly(this,randomXpos,randomYpos));
    }
    
      @override
      void render(Canvas canvas) {
        //Painting or creating our background
        Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
        Paint bgPaint = Paint();
        bgPaint.color = Color(0xff576574);
        canvas.drawRect(bgRect, bgPaint);
        flies.forEach((Fly fly) => fly.render(canvas));
      }
    
      @override
      void update(double t) {
        // TODO: implement update
        flies.forEach((Fly fly) => fly.update(t));
      }
    
      void resize(Size size){
          screenSize = size;
          //16:9 and modified to fit on any size
          tileSize = screenSize.width/9;
      }

      @override
  void onTapDown(TapDownDetails d) {
      flies.forEach((Fly fly){
          if(fly.flyRect.contains(d.globalPosition)){
              fly.onTapDown();
          }
      });
  }
      
}