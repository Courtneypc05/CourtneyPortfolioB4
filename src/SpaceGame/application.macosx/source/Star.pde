class Star {
  // member variables
  int x,y,speed,dia;
  color c;
  
  // constructor
  Star(int x, int y) {
    this.x=x;
    this.y=y;
    speed = int(random(1,10));
    dia = int(random(1,4));
    c = color(random(190,255));
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
    noStroke();
    ellipse(x,y,dia,dia);
  }
}
