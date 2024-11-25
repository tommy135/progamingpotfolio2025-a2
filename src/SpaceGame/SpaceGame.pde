// tommy thomspon // SpaceGame // nov 6 2024 //
import processing.sound.*;
SoundFile laser;
int score, level, rockTime;
boolean play;
Spaceship s1;
Rock r1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
Timer rTime, puTime;

void setup() {
  size(500, 500);
  laser = new SoundFile(this,"laser.wav");
  s1 = new Spaceship();
  rTime = new Timer(rockTime);
  rTime = new Timer (800);
  rTime.start();
  puTime = new Timer(7000);
  puTime.start();
  noCursor();
}

void draw() {
  background(0);
  if (!play) {
    startScreen();
  } else {
if (frameCount % 1000 == 0) {
level = level +1;
rockTime-=50;
}
    background(0);
    stars.add(new Star());
    for (int i = 0; i<stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }
  

    for (int i = lasers.size() - 1; i >= 0; i--) {
      Laser laser = lasers.get(i);
      laser.display();
      laser.move();
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (laser.intersect(r)) {
          //
          score+=r.diam;
          lasers.remove(laser);
          rocks.remove(r);
        }

        if (laser.reachedTop()) {
          lasers.remove(laser);
        }
      }
    }

    //Power up Logic
    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }

    s1.display();
    s1.move(mouseX, mouseY);
    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }
    for (int i = powups.size() - 1; i >= 0; i--) {
      Powerup pu = powups.get(i);
      pu.display();
      pu.move();
      if (pu.intersect(s1)) {
        if (pu.type == 'h') {
          s1.health += 100;
        }
        else if (pu.type == 'a') {
          s1.laserCount += 100;
        }
        //remove the pu
        powups.remove(pu);
      }
      if (pu.reachedBottom()) {
        powups.remove(pu);
      }
    }

    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();
    if (s1.health < 1) {
      gameOver();
      noLoop();
    }

    for (int i = rocks.size() - 1; i >= 0; i--) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        s1.health -= rock.diam;
        rocks.remove(rock);
        score += rock.diam;
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
      }
    }
    infoPanel();
  }
}



void keyPressed() {
  laser.play();
  if (key == ' ' && s1.fire()) {
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount--;
  }
}

void infoPanel() {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 20, width, 40);
  fill(255);
  textSize(23);
  text("socre:" + score, 10, 35);
  text("health:" + s1.health, 120, 35);
  text("Ammo:" + s1.laserCount, 260, 35);
  text("Level:" + level, 390, 35);
}


void startScreen() {
  background (0);
  fill(255);
  textSize(35);
  textAlign(CENTER);
  text("welcome to spacegame", width/2, 300);
  text("click to start...", width/2, 350);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  text("game_Over:", width/2, 300);
  text("score", width/2, 300);
}

void ticker() {
}

void mousePressed() {
  
}
