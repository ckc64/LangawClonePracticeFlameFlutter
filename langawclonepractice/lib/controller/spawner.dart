import 'package:langawclonepractice/langawgame.dart';
import 'package:langawclonepractice/components/fly.dart';


class FlySpawner {
  final LangawGame game;
  final int maxSpawnInterval = 3000; //3000ms is equal to 3secs 
  final int minSpawnInterval = 250; //1/4 of a seconds(1000ms)
  final int intervalChange = 3; //it will make fly spawn faster
  final int maxFliesOnScreen = 7; //maximum number of flies

  int currentInterval; //will hold the time that will add to the current time
  int nextSpawn; //schedule

  FlySpawner(this.game) {

    start(); //this will schedule the fly to spawn in 3secs
    game.spawnFly();

  }

  void start() {

    killAll();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;

  }

  void killAll() {
    game.flies.forEach((Fly fly) => fly.isDead = true);
  }

  void update(double t) {
    int nowTimestamp = DateTime.now().millisecondsSinceEpoch; //current time

    int livingFlies = 0; //number of flies

    game.flies.forEach((Fly fly) {
        if (!fly.isDead) livingFlies += 1; //add one fly if not dead
    });
          //if current time passed 3secs and flies are not more thant 7
    if (nowTimestamp >= nextSpawn && livingFlies < maxFliesOnScreen) {
      game.spawnFly();
        //if currentInterval(3000) is still greater than minSpawnInterval(250)
        //currentInterval will subtract 3 then
        //current interval will change it value

        if (currentInterval > minSpawnInterval) {
          currentInterval -= intervalChange;
          currentInterval -= (currentInterval * .02).toInt();
        }
        //nextSpawn is now the current add currentInterval
      nextSpawn = nowTimestamp + currentInterval;
    }

  }
}