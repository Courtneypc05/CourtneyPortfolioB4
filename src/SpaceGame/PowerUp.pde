class PowerUp {
  // member variables
  int x, y, speed, dia, pu;
  String[] puInfo = {"Ammo", "Health", "Lasers"};
  char displayMode;
  color c;

  // constructor
  PowerUp(int x, int y) {
    this.x=x;
    this.y=y;
    dia = 0;
    speed = int(random(2, 8));
    pu = int(random(4));
    displayMode = '1';
    c = #74665C;
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y > height + dia*4) {
      return true;
    } else {
      return false;
    }
  }

  // member methods
  void display() {
    noStroke();
    switch(pu) {
      case 0: // Ammo
      fill(255,0,0);
      ellipse(x,y,dia,dia);
      fill(255);
      textSize(9);
      textAlign(CENTER);
      text(puInfo[0], x, y);
      break;
    }
    fill(c);
    ellipse(x, y, dia, dia);
  }
}
