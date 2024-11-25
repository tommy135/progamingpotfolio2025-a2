class Spaceship {
  // Member Variables
  int x, y, w, health, laserCount, turretCount;

  //Constructer
  Spaceship() {
    x = width/2;
    y = height/2;
    w =100;
    health = 100;
    laserCount = 100;
    turretCount = 1;
  }

  void display() {
    fill(127);
    rect(x+20, y+40, 10, 10);
    triangle(x, y-40, x+35, y+40, x-35, y+40);
    fill(80);
    triangle(x, y-35, x+8, y-20, x-8, y-20);
    ellipse(x, y+20, 20, 60);
    stroke(220);
    strokeWeight(2);
    line(x+20, y-20, x+20, y-20);
  }// tommy thompson | 30 oct 2024 | Space Ship
  // goal: create a spcaeship graphic that fallows the mouse





  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean fire() {
    if (laserCount > 0) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Rock r) {
    float d = dist(r.x, r.y, x, y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
