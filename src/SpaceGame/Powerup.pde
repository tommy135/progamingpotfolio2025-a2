class Powerup {
  // Member Variables
  int x, y, diam, speed;
  char type;
  //PImage r1;

  //Constructer
  Powerup() {
    x = int(random(width));
    y = -20;
    diam = (20);
    speed = int(random(1, 5));
    int rand = int(random(1, 5));
    if (rand <= 1) {
      type = 'h';
    } else {
      type = 'a';
    }
    //r1 = loadImage("rock1.png");
  }

  void display() {
    if(type == 'h') {
      fill(0,200,0);
    } else if (type == 'a') {
      fill(209,0,0);
     }
      ellipse(x,y,diam,diam);
  }

  void move() {
    this.y += speed;
  }

  boolean intersect(Spaceship r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) { // refine collision
      return true;
    } else {
      return false;
    }
  }

  boolean reachedBottom() {
    if (y > height + 200) {
      return true;
    } else {
      return false;
    }
  }
}
