// SpaceGame | Dec 2020
// by Courtney Cannon
// TODO: Project Setup
import processing.sound.*;
SoundFile laser;
SpaceShip s1;
ArrayList<Laser> lasers;
ArrayList<Asteroid> asteroids;
ArrayList<Star> stars;
ArrayList<PowerUp> pUps;
Timer timer, puTimer;
int pass, score;
boolean play;

void setup() {
  size(500, 500);
  laser = new SoundFile(this, "Glass-tap-02.wav");
  s1 = new SpaceShip();
  lasers = new ArrayList();
  asteroids = new ArrayList();
  stars = new ArrayList();
  pUps = new ArrayList();
  timer = new Timer(int(random(500, 900)));
  puTimer = new Timer(5000);
  pass = 0;
  play = false;
  score = 0;
  timer.start();
  puTimer.start();
}

void draw() {
  noCursor();
  if (!play) {
    startScreen();
  } else {
    background(0);

    stars.add(new Star(int(random(width)), int(random(height))));
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
      }
    }

    if (timer.isFinished()) {
      asteroids.add(new Asteroid(int(random(width)), -50));
      timer.start();
    }

    for (int i = 0; i < asteroids.size(); i++) {
      Asteroid asteroid = asteroids.get(i);
      asteroid.display();
      asteroid.move();
      // Asteroid vs Ship Collision
      if (s1.asteroidIntersection(asteroid)) {
        s1.health-=asteroid.health;
        asteroids.remove(asteroid);
        score+=50;
      }
      if (asteroid.reachedBottom()) {
        pass++;
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
        if (asteroid.laserIntersection(laser)) {
          lasers.remove(laser);
          score+=5;
          asteroid.health-=laser.power;
          if (asteroid.health<1) {
            asteroids.remove(asteroid);
            score+=asteroid.health;
          }
        }
      }

      // PowerUp rendering and collision detection
      for (int i = 0; i<pUps.size(); i++) {
        PowerUp pu = pUps.get(i);
        pu.move();
        pu.display();
        // PowerUp and ship intersection
        if (s1.puIntersect(pu)) {
          if (pu.pu == 0) {
            s1.ammo+=1000;
          } else if (pu.pu == 1) {
            s1.health+=100;
          } else if (pu.pu == 2) {
            weaponCount++;
          } else if (pu.pu == 3) {
            superWeapon++;
          }
          pUps.remove(pu);
        }
        if (pu.reachedBottom()) {
          pUps.remove(pu);
        }
      }
      // Display Ship
      s1.display(mouseX, mouseY);
      infoPanel();

      // GameOver Logic
      if (s1.health<1 || pass>100) {
        play = false;
        gameOver();
      }
    }
  }

  void mousePressed() {
    if (play) {
      laser.play();
    }
    laser.play();
    if (s1.ammo > 0) {
      lasers.add(new Laser(s1.x, s1.y));
    }
    s1.ammo--;
  }

  void startScreen() {
    background(0);
    textAlign(CENTER);
    text("Welcome!", width/2, height/2);
    text("Click to Continue...", width/2, height/2+20);

    if (mousePressed) {
      play = true;
    }
  }

  void infoPanel() {
    fill(128, 128);
    rectMode(CORNER);
    rect(0, height-50, width, 50);
    fill(255, 128);
    text("Health:" + s1.health, 20, height-20);
    text("Lives:" + s1.lives, 150, height-20);
    text("Ammo:" + s1.ammo, 210, height-20);
    text("Level:", 300, height-20);
    text("Score:" + score, 350, height-20);
    if (pass>7) {
      fill(255, 0, 0);
    }
    text("Pass:" + pass, 420, height-30);
  }

  void gameOver() {
    background(0);
    textAlign(CENTER);
    fill(222);
    text("Game Over!", width/2, height/2);
    text("Final Score:" + score, width/2, height/2+20);
    // text("You made it to level" + level, width/2, height/2+40);
    noLoop();
  }
