class Asteroid {
  // member variables
  int x, y, dia, health,speed, rad;
  char displayMode;
  color c;
  PImage asteroid;

  // constructor
  Asteroid(int x, int y) {
    this.x=x;
    this.y=y;
    dia = 50;
    health = 50;
    speed = int(random(1,8));
    rad = 25;
    displayMode = '1';
    asteroid = loadImage("asteroidss.png");
    
  }
  
  // Laser vs Asteroid Intersection
   boolean laserIntersection(Laser laser) {
    float distance = dist(x, y, laser.x, laser.y);
    if (distance < rad + laser.rad) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedBottom() {
    if (y>height) {
      return true;
    } else {
      return false;
    }
  }

  void move() {
    y+=speed;
  }

  // member methods
  void display() {
    fill(c);
    //ellipse(x, y, dia, dia);
    image(asteroid,x,y);
  }
}
