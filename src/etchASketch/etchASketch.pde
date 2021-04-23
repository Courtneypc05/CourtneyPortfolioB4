// Global Variable
int x, y;

void setup() {
  size(500, 500);
  frameRate(10);
  x = 10;
  y = 10;
}

void draw() {
  fill(0);
  strokeWeight(3);
  if (keyPressed) {
    if (key == 'd' || key == 'D') {
      moveRight(5);
    } else if (key == 'a' || key == 'A') {
      moveLeft(5);
    } else if (key == 'w' || key == 'W') {
      moveUp(5);
    } else if (key == 's' || key == 'S') {
      moveDown(5);
    }
  }
  //drawName();
  //noLoop();
}

void mousePressed() {
  saveFrame("line-######.png");
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      moveRight(5);
    } else if (keyCode == LEFT) {
      moveLeft(5);
    } else if (keyCode == UP) {
      moveUp(5);
    } else if (keyCode == DOWN) {
      moveDown(5);
    }
  }
}

void drawName() {
  //moveRight(150);
  //moveRightDown(30);
  //moveLeftUp(30);
  //moveLeft(60);
  //moveLeftDown(30);
  //moveDown(150);
  //moveRightDown(30);
  //moveRight(60);
  //moveRightUp(30);
  //moveRight(20);
  //moveRightDown(30);
  //moveRight(60);
  //moveRightUp(30);
  //moveUp(150);
  //moveLeftUp(30);
  //moveLeft(60);
  //moveLeftDown(30);
  //moveDown(150);
  //moveRightDown(30);
  //moveRight(60);
  //moveRightUp(30);
  //moveRight(20);  
  //moveUp(180);
  //moveDown(180);
  //moveRightDown(30);
  //moveRight(60);
  //moveRightUp(30);
  //moveUp(180);
  //moveDown(180);
  //moveRight(20);
  //moveDown(15);
  //moveUp(180);
  //moveRight(95);
  //moveRightDown(15);
  //moveDown(50);
  //moveLeftDown(15);
  //moveLeft(95);
  //moveRight(95);
  //moveRightDown(15);
  //moveDown(85);
  //moveRight(90);
  //moveDown(10);
  //moveUp(190);
  //moveLeft(70);
  //moveRight(140);
}

// Method to draw right lines
void moveRight(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y);
  }
  x=x+rep;
}

// Method to draw lines down
void moveDown(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y+i);
  }
  y=y+rep;
}

// Method to draw lines down
void moveUp(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y-i);
  }
  y=y-rep;
}

// Method to draw lines down
void moveLeft(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y);
  }
  x=x-rep;
}

// Method to draw left and down lines
void moveLeftDown(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y+i);
  }
  x=x-rep;
  y=y+rep;
}

// Method to draw right and down lines
void moveRightDown(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y+i);
  }
  x=x+rep;
  y=y+rep;
}

// Method to draw right and up lines
void moveRightUp(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y-i);
  }
  x=x+rep;
  y=y-rep;
}

// Method to draw left and up lines
void moveLeftUp(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y-i);
  }
  x=x-rep;
  y=y-rep;
}
