import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class etchASketch extends PApplet {

// Global Variable
int x, y;

public void setup() {
  
  frameRate(10);
  x = 10;
  y = 10;
}

public void draw() {
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

public void mousePressed() {
  saveFrame("line-######.png");
}

public void keyPressed() {
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

public void drawName() {
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
public void moveRight(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y);
  }
  x=x+rep;
}

// Method to draw lines down
public void moveDown(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y+i);
  }
  y=y+rep;
}

// Method to draw lines down
public void moveUp(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y-i);
  }
  y=y-rep;
}

// Method to draw lines down
public void moveLeft(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y);
  }
  x=x-rep;
}

// Method to draw left and down lines
public void moveLeftDown(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y+i);
  }
  x=x-rep;
  y=y+rep;
}

// Method to draw right and down lines
public void moveRightDown(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y+i);
  }
  x=x+rep;
  y=y+rep;
}

// Method to draw right and up lines
public void moveRightUp(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y-i);
  }
  x=x+rep;
  y=y-rep;
}

// Method to draw left and up lines
public void moveLeftUp(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y-i);
  }
  x=x-rep;
  y=y-rep;
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "etchASketch" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
