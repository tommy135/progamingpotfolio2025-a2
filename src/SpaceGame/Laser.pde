class Laser {
  // Member Variables
  int x, y, w, h, speed;

  //Constructer
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 5;
    h = 30;
    speed = 3;
  }

  void display() {
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    y = y - speed;
  }



  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<20) { // refine collision
      return true;
    } else {
      return false;
    }
  }

  boolean reachedTop() {
    if (y<-20) {
      return true;
    } else {
      return false;
    }
  }
}
