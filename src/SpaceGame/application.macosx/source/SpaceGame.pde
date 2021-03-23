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

void setup() {
  size(500, 500);
  s1 = new SpaceShip();
  lasers = new ArrayList();
  asteroids = new ArrayList();
  stars = new ArrayList();
  timer = new Timer(int(random(500, 900)));
  pass = 0;
  weaponCount = 1;
  enemyHealth = 100;
  superWeapon = 0;
  play = false;
  score = 0;
  timer.start();
}

void draw() {
  noCursor();
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

void mousePressed() {
  if(s1.ammo > 0) {
  lasers.add(new Laser(s1.x, s1.y));
  }
  s1.ammo--;
}

void infoPanel() {
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
