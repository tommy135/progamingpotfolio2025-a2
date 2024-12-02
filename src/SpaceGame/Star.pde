class Star {
  // Member Variables
  int x, y, w, h, speed, diam;

  //Constructer
  Star() {
    
    this.x = int(random(width));
    this.y = -10;
    w = 5;
    h = 30;
    speed = int(random(1, 4));
    diam = int(random(1, 6));
  }

  void display() {
    fill(255);
    ellipse(x, y, diam, diam);
  }

  void move() {
    y += speed;
  }

  void fire() {
  }

  boolean reachedBottom() {
    if (y > height +10) {
      return true;
    } else {
      return false;
    }
  }
}
