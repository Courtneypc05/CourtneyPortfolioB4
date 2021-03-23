class PowerUp {
  // member variables
  int x,y,dia;
  char displayMode;
  color c;
  
  // constructor
  PowerUp() {
    x=0;
    y=0;
    dia = 0;
    displayMode = '1';
    c = #74665C;
  }
  
  // member methods
  void display() {
    fill(c);
    ellipse(x,y,dia,dia);
  }
}
