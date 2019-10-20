
import 'dart:ui';
import 'package:flame/game.dart';

class LangawGame extends Game{
  Size screenSize;
  double tileSize;

  @override
  void render(Canvas canvas) {
    //Painting or creating our background
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
  }

  @override
  void update(double t) {
    // TODO: implement update
  }

  void resize(Size size){
      screenSize = size;
      tileSize = screenSize.width/9;
  }
}