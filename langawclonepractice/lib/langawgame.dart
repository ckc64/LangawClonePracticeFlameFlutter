
import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'components/fly.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:langawclonepractice/components/backyard.dart';
import 'package:langawclonepractice/components/housefly.dart';
import 'package:langawclonepractice/components/agilefly.dart';
import 'package:langawclonepractice/components/droolerfly.dart';
import 'package:langawclonepractice/components/hungryfly.dart';
import 'package:langawclonepractice/components/machofly.dart';
import 'package:langawclonepractice/controller/spawner.dart';

class LangawGame extends Game{
  Size screenSize;
  double tileSize;
  List<Fly>flies;
  Random rnd;
  Backyard background;
  FlySpawner spawner;

  LangawGame(){
    initialize();
  }

    void initialize() async {
        flies = List<Fly>();
        rnd = Random();
        resize(await Flame.util.initialDimensions());
        background = Backyard(this);
        spawner = FlySpawner(this);
        this.spawner.start();
        
    }
    
    void spawnFly(){
      double randomXpos = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025));
      double randomYpos = rnd.nextDouble() * (screenSize.height - (tileSize * 2.025));
      switch (rnd.nextInt(5)) {
          case 0:
            flies.add(HouseFly(this, randomXpos, randomYpos));
            break;
          case 1:
            flies.add(DroolerFly(this, randomXpos, randomYpos));
            break;
          case 2:
            flies.add(AgileFly(this, randomXpos, randomYpos));
            break;
          case 3:
            flies.add(MachoFly(this, randomXpos, randomYpos));
            break;
          case 4:
            flies.add(HungryFly(this, randomXpos, randomYpos));
            break;
        }
    }
    
      @override
      void render(Canvas canvas) {
        //Painting or creating our background
        background.render(canvas);
        flies.forEach((Fly fly) => fly.render(canvas));
      }
    
      @override
      void update(double t) {
        // TODO: implement update
        flies.forEach((Fly fly) => fly.update(t));
        flies.removeWhere((Fly fly) => fly.isOffScreen);
        spawner.update(t);
      }
    
      void resize(Size size){
          screenSize = size;
          //16:9 and modified to fit on any size
          tileSize = screenSize.width/9;
      }

      @override
  void onTapDown(TapDownDetails d) {
    super.onTapDown(d);
      flies.forEach((Fly fly){
          if(fly.flyRect.contains(d.globalPosition)){
              fly.onTapDown();
          }
      });
  }
      
}