class Rock {
  // Member Variables
  int x, y, diam, speed;
  PImage r1;

  //Constructer
  Rock() {
    x = int(random(width));
    y = -200;
    diam = (5);
    speed = int(random(1, 5));
    ;
    r1 = loadImage("rock1.png");
  }

  void display() {
    image(r1, x, y);
  }

  void move() {
    this.y += speed;
  }

  boolean reachedBottom() {
    if (y > height + 200) {
      return true;
    } else {
      return false;
    }
  }
}
