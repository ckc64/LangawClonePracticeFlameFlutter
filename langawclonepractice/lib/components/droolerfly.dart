import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:langawclonepractice/components/fly.dart';
import 'package:langawclonepractice/langawgame.dart';

class DroolerFly extends Fly {
  double get speed => game.tileSize * 1.5;
  DroolerFly(LangawGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flyingSprite = List();
    flyingSprite.add(Sprite('flies/drooler-fly-1.png'));
    flyingSprite.add(Sprite('flies/drooler-fly-2.png'));
    deadSprite = Sprite('flies/drooler-fly-dead.png');
  }
}