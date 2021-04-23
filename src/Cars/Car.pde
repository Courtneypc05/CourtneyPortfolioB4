class Car {
  // member variables
  color c;
  float xpos, ypos, xspeed;
  boolean right;

  // constructor
  Car(color c, float xspeed) {
    this.c = c;
    xpos = random(width);
    ypos = random(height);
    this.xspeed = xspeed;
    if (random(10)>5) {
      right = true;
    } else {
      right = false;
    }
  }

  // member methods
  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 20, 10, 3);
    fill(0);
    rect(xpos-6, ypos-5, 5, 3);
    rect(xpos-6, ypos+5, 5, 3);
    rect(xpos+6, ypos-5, 5, 3);
    rect(xpos+6, ypos+5, 5, 3);
  }

  void drive() {
    if (right) {
      xpos += xspeed;
      if (xpos>width) {
        xpos = 0;
      }
    } else {
      xpos -= xspeed;
      if (xpos < 0) {
        xpos = width;
      }
    }
  }
}
