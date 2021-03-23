class SpaceShip {
  // member variable
  int x, y, health, ammo, lives, rad;
  char displayMode;

  // constructor
  SpaceShip() {
    x = 0;
    y = 0;
    health = 100;
    ammo = 1000;
    lives = 3;
    rad = 25;
    displayMode = '1';
  }

  // Rock vs. Ship Collision
  boolean asteroidIntersection(Asteroid asteroid) {
    float distance = dist(x, y, asteroid.x, asteroid.y);
    if (distance < rad + asteroid.rad) {
      return true;
    } else {
      return false;
    }
  }

  // member methods
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    if (displayMode == '1') {
      ellipseMode(CENTER);
      stroke(169, 169, 169);
      fill(169);
      ellipse(x, y, 50, 30);
      stroke(0, 255, 255);
      fill(0, 255, 255);
      ellipse(x+0, y-10, 25, 18);
      stroke(255, 255, 255);
      fill(255, 255, 255);
      ellipse(x-17, y-1, 3, 3);
      ellipse(x-9, y+5, 3, 3);
      ellipse(x-0, y+8, 3, 3);
      ellipse(x+10, y+6, 3, 3);
      ellipse(x+17, y+0, 3, 3);
    }
  }
}
