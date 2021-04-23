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

public class Cars extends PApplet {

Car[] cars = new Car[200];

public void setup() {
  
  for(int i=0; i<cars.length; i++){
    cars[i] = new Car(color(random(255),random(255),random(255)), random(1,5));
  }
}

public void draw() {
  background(255);
  for(int i=0; i<cars.length; i++){
    cars[i].display();
    cars[i].drive();
  }

}
class Car {
  // member variables
  int c;
  float xpos, ypos, xspeed;
  boolean right;

  // constructor
  Car(int c, float xspeed) {
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
  public void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 20, 10, 3);
    fill(0);
    rect(xpos-6, ypos-5, 5, 3);
    rect(xpos-6, ypos+5, 5, 3);
    rect(xpos+6, ypos-5, 5, 3);
    rect(xpos+6, ypos+5, 5, 3);
  }

  public void drive() {
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
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Cars" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
