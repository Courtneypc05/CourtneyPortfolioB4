class Laser {
  // member variables
  int x,y,speed,rad,power;
  color c;
  
  // constructor
  Laser(int x, int y) {
    this.x=x;
    this.y=y;
    speed = 6;
    power = int(random(10,30));
    rad = 4;
    c = #FF6803;
  }
  
  // member methods
  void fire() {
    y-=speed;
  }
  
  boolean reachedTop() {
    if(y<-3) {
      return true;
    } else {
      return false;
    }
  }
  
  
  void display() {
    fill(c);
    noStroke();
    rectMode(CENTER);
    rect(x,y,rad,rad*2);
  }
}
