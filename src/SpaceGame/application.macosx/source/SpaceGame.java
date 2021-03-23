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

public class SpaceGame extends PApplet {

// SpaceGame | Dec 2020
// by Courtney Cannon
// TODO: Project Setup

SpaceShip s1;
ArrayList<Laser> lasers;
ArrayList<Asteroid> asteroids;
ArrayList<Star> stars;
Timer timer;
int pass, rockRate, level, rockCount, laserCount, score, weaponCount, enemyHealth, superWeapon;
boolean play;

public void setup() {
  
  s1 = new SpaceShip();
  lasers = new ArrayList();
  asteroids = new ArrayList();
  stars = new ArrayList();
  timer = new Timer(PApplet.parseInt(random(500, 900)));
  pass = 0;
  weaponCount = 1;
  enemyHealth = 100;
  superWeapon = 0;
  play = false;
  score = 0;
  timer.start();
}

public void draw() {
  noCursor();
  background(0);

  stars.add(new Star(PApplet.parseInt(random(width)), PApplet.parseInt(random(height))));
  for (int i = 0; i < stars.size(); i++) {
    Star star = stars.get(i);
    star.display();
    star.move();
    if (star.reachedBottom()) {
      stars.remove(star);
    }
  }

  if (timer.isFinished()) {
    asteroids.add(new Asteroid(PApplet.parseInt(random(width)), -50));
    timer.start();
  }

  for (int i = 0; i < asteroids.size(); i++) {
    Asteroid asteroid = asteroids.get(i);
    asteroid.display();
    asteroid.move();
    // Asteroid vs Ship Collision
    if(s1.asteroidIntersection(asteroid)) {
      s1.health-=asteroid.health;
      asteroids.remove(asteroid);
      score+=50;
    }
    if (asteroid.reachedBottom()) {
      asteroids.remove(asteroid);
    }
  }

  for (int i = 0; i < lasers.size(); i++) {
    Laser laser = lasers.get(i);
    laser.display();
    laser.fire();
    // Laser vs Asteroid Intersection
    for (int j = 0; j < asteroids.size(); j++) {
      Asteroid asteroid = asteroids.get(j);
      if(asteroid.laserIntersection(laser)) {
        lasers.remove(laser);
        score+=5;
        asteroid.health-=laser.power;
        if(asteroid.health<1){
          asteroids.remove(asteroid);
          score+=asteroid.health;
        }
      }
    }
    
    if (laser.reachedTop()) {
      lasers.remove(laser);
    }
  }

  infoPanel();

  s1.display(mouseX, mouseY);
}

public void mousePressed() {
  if(s1.ammo > 0) {
  lasers.add(new Laser(s1.x, s1.y));
  }
  s1.ammo--;
}

public void infoPanel() {
  fill(128, 128);
  rectMode(CORNER);
  rect(0, height-50, width, 50);
  fill(255,128);
  text("Health:" + s1.health, 20,height-20);
  text("Lives:" + s1.lives, 150,height-20);
  text("Ammo:" + s1.ammo, 210,height-20);
  text("Level:" , 300,height-20);
  text("Score:" + score, 350,height-20);
}
class Asteroid {
  // member variables
  int x, y, dia, health,speed, rad;
  char displayMode;
  int c;
  PImage asteroid;

  // constructor
  Asteroid(int x, int y) {
    this.x=x;
    this.y=y;
    dia = 50;
    health = 50;
    speed = PApplet.parseInt(random(1,8));
    rad = 25;
    displayMode = '1';
    asteroid = loadImage("asteroidss.png");
    
  }
  
  // Laser vs Asteroid Intersection
   public boolean laserIntersection(Laser laser) {
    float distance = dist(x, y, laser.x, laser.y);
    if (distance < rad + laser.rad) {
      return true;
    } else {
      return false;
    }
  }

  public boolean reachedBottom() {
    if (y>height) {
      return true;
    } else {
      return false;
    }
  }

  public void move() {
    y+=speed;
  }

  // member methods
  public void display() {
    fill(c);
    //ellipse(x, y, dia, dia);
    image(asteroid,x,y);
  }
}
class EnemyShip {
  // member variable
  int x, y, health;
  char displayMode;

  // constructor
  EnemyShip() {
    x = 0;
    y = 0;
    health = 100;
    displayMode = '1';
  }

  // member methods
  public void display(int x, int y) {
    if (displayMode == '1') {
      // TODO: create enemy graphic
    }
  }
}
class Laser {
  // member variables
  int x,y,speed,rad,power;
  int c;
  
  // constructor
  Laser(int x, int y) {
    this.x=x;
    this.y=y;
    speed = 6;
    power = PApplet.parseInt(random(10,30));
    rad = 4;
    c = 0xffFF6803;
  }
  
  // member methods
  public void fire() {
    y-=speed;
  }
  
  public boolean reachedTop() {
    if(y<-3) {
      return true;
    } else {
      return false;
    }
  }
  
  
  public void display() {
    fill(c);
    noStroke();
    rectMode(CENTER);
    rect(x,y,rad,rad*2);
  }
}
class PowerUp {
  // member variables
  int x,y,dia;
  char displayMode;
  int c;
  
  // constructor
  PowerUp() {
    x=0;
    y=0;
    dia = 0;
    displayMode = '1';
    c = 0xff74665C;
  }
  
  // member methods
  public void display() {
    fill(c);
    ellipse(x,y,dia,dia);
  }
}
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
  public boolean asteroidIntersection(Asteroid asteroid) {
    float distance = dist(x, y, asteroid.x, asteroid.y);
    if (distance < rad + asteroid.rad) {
      return true;
    } else {
      return false;
    }
  }

  // member methods
  public void display(int x, int y) {
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
class Star {
  // member variables
  int x,y,speed,dia;
  int c;
  
  // constructor
  Star(int x, int y) {
    this.x=x;
    this.y=y;
    speed = PApplet.parseInt(random(1,10));
    dia = PApplet.parseInt(random(1,4));
    c = color(random(190,255));
  }
  
   public boolean reachedBottom() {
    if (y>height) {
      return true;
    } else {
      return false;
    }
  }

  public void move() {
    y+=speed;
  }
  
  // member methods
  public void display() {
    fill(c);
    noStroke();
    ellipse(x,y,dia,dia);
  }
}
// Example 10-5: Object-oriented timer
// by Daniel Shiffman

class Timer {

  int savedTime; // When Timer started
  int totalTime; // How long Timer should last

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  // Starting the timer
  public void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis();
  }

  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  public boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SpaceGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
