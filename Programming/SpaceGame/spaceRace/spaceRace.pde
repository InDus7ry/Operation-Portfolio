//spaceRace 2018 © Gabe Wong //<>//
//TODO:

//Each Char @ 100pt is 60 px wide

//GLOBAL
//Imports
import processing.sound.*;
Sound s;

//Objects
PFont courierNew;
ArrayList<Lazer> lasers;
ArrayList<Rock> rocks;
ArrayList<PowerUp> PUs;
Timer timer;
Timer fireCap;
Timer flashTime;
Timer pTime;
UI ui;
Ship friend;
Background back;
SoundFile ding;

//Primitive
int rockRate;
int fCap;
int flTime;
int pRate;
int level;
int shipX;
float deg;
int score;
color cannonType;
int health;
boolean gameover;
boolean loss;
boolean win;
boolean rocksCleared;
boolean powerup;

//settings vars
int stars;
int[] backgroundx = new int[1001];
int[] backgroundy = new int[1001];

//Top Scores
int[] topScores = new int[10];

void setup() {
  size(1920, 1080);
  frameRate(60);
  //font declaration
  courierNew = createFont("couriernew.ttf", 20);
  //Numbers
  stars = 100;
  rockRate=5000;
  cannonType = color(255, 140, 0);
  fCap = 200;
  flTime = 200;
  pRate = 5000;
  health = 3;
  level=1;
  shipX=width/2;
  //INITIALIZATION
  ui = new UI(color(255, 50, 50));
  friend = new Ship(0, 0, 100);
  lasers = new ArrayList<Lazer>();
  rocks = new ArrayList<Rock>();
  PUs = new ArrayList<PowerUp>();
  ding = new SoundFile(this, "ding.wav");
  pTime = new Timer(pRate);
  fireCap = new Timer(fCap);
  flashTime = new Timer(flTime);
  timer = new Timer(rockRate);
  back = new Background(color(0));
  //BOOLEANS
  gameover = false;
  loss=false;
  win=false;
  rocksCleared=false;

  //initate static background stars
  for (int i=0; i<1000; i++) {
    backgroundx[i]=int(random(width));
    backgroundy[i]=int(random(height));
  }
}

void draw() {
  //debug prints
  //background declaration
  back.display();
  if (ui.Play.clicked && !gameover) {
    rocksCleared=false;
    //Game Environment
    if(powerup && !pTime.isFinished()){
      for(int i=lasers.size()-1; i>=0; i--){
        Lazer las = lasers.get(i);
        las.v=15;
        las.c=color(255, 0, 0);
        fireCap.totalTime = 50;
      }
    } else {
      powerup=false;
      for(int i=lasers.size()-1; i>=0; i--){
        Lazer las = lasers.get(i);
        las.c=color(10, 240, 0);
        fireCap.totalTime = 200;
      }
    }
    //Timer-Rock
    if (timer.isFinished()) {
      rocks.add(new Rock(int(random(20, width-20)), -20, int(random(100, 200)), 2));
      float i = random(0, 10);
      if (level>1 && i>8 && level <5) {
        PUs.add(new PowerUp(int(random(20, width-20)), -20));
      } else if(level>=5 && i>9.8){
        PUs.add(new PowerUp(int(random(20, width-20)), -20));
      }
      timer.start();
    }
    //Rock
    for (int i=rocks.size()-1; i>=0 && !rocksCleared; i--) {
      Rock rock = rocks.get(i);
      rock.move();
      rock.display();
      if (rock.reachedBottom()) {
        rocks.remove(rock);
        health -=1;
        flashTime.start();
        if (health < 1) {
          rocks.clear();
          lasers.clear();
          gameover=true;
          loss=true;
          rocksCleared = true;
        }
      }
      //Collision
      for (int j=lasers.size()-1; j>=0; j--) {
        Lazer las = lasers.get(j);
        switch(rock.type) {
        case 1:
          if (las.x>=rock.coordx[3] && las.x <=rock.coordx[1]) {
            if (las.x>=rock.coordx[3] && las.x<rock.coordx[2]) {
              if (las.y<rock.bottomCollision(las.x)) {
                rock.hit = true;
                rock.health-=10;
                lasers.remove(las);
                score++;
                if (rock.health<30) {
                  rocks.remove(rock);
                }
              }
            } else if (las.x>=rock.coordx[2] && las.x<=rock.coordx[1]) {
              if (las.y<rock.rightCollision(las.x)) {
                rock.hit = true;
                rock.health-=10;
                lasers.remove(las);
                score++;
                if (rock.health<30) {
                  rocks.remove(rock);
                }
              }
            }
          }
          break;
        case 2:
          if (las.x>=rock.coordx[3] && las.x <=rock.coordx[2]) {
            if (las.y<rock.bottomCollision(las.x)) {
              rock.hit = true;
              rock.health-=10;
              lasers.remove(las);
              score++;
              if (rock.health<30) {
                rocks.remove(rock);
              }
            }
          }
          break;
        case 3:
          if (las.x>=rock.coordx[0] && las.x <=rock.coordx[1]) {
            if (las.x>=rock.coordx[0] && las.x<rock.coordx[3]) {
              if (las.y<rock.leftCollision(las.x)) {
                rock.hit = true;
                rock.health-=10;
                lasers.remove(las);
                score++;
                if (rock.health<30) {
                  rocks.remove(rock);
                }
              }
            } else if (las.x>=rock.coordx[3] && las.x<rock.coordx[2]) {
              if (las.y<rock.bottomCollision(las.x)) {
                rock.hit = true;
                rock.health-=10;
                lasers.remove(las);
                score++;
                if (rock.health<30) {
                  rocks.remove(rock);
                }
              }
            } else if (las.x>=rock.coordx[2] && las.x<=rock.coordx[1]) {
              if (las.y<rock.rightCollision(las.x)) {
                rock.hit = true;
                rock.health-=10;
                lasers.remove(las);
                score++;
                if (rock.health<30) {
                  rocks.remove(rock);
                }
              }
            }
          }
          break;
        case 4:
          if (las.x>=rock.coordx[0] && las.x <=rock.coordx[2]) {
            if (las.x>=rock.coordx[0] && las.x<rock.coordx[3]) {
              if (las.y<rock.leftCollision(las.x)) {
                rock.hit = true;
                rock.health-=10;
                lasers.remove(las);
                score++;
                if (rock.health<30) {
                  rocks.remove(rock);
                }
              }
            } else if (las.x>=rock.coordx[3] && las.x<=rock.coordx[2]) {
              if (las.y<rock.bottomCollision(las.x)) {
                rock.hit = true;
                rock.health-=10;
                lasers.remove(las);
                score++;
                if (rock.health<30) {
                  rocks.remove(rock);
                }
              }
            }
          }
          break;
        }
      }
      if (dist(friend.x, friend.y, rock.x, rock.y)<(rock.health/2)+30) {
        health -=1;
        flashTime.start();
        rocks.remove(rock);
        if (health < 1) {
          rocks.clear();
          lasers.clear();
          gameover=true;
          loss=true;
          rocksCleared = true;
        }
      }
    }
    for (int i = lasers.size()-1; i>=0; i--) {
      Lazer las = lasers.get(i);
      las.fire();
      las.display();
      if (las.reachOut()) {
        lasers.remove(las);
      }
    }
    for (int i = PUs.size()-1; i>=0; i--) {
      PowerUp pu = PUs.get(i);
      pu.move();
      pu.display();
      if (pu.bottom()) {
        PUs.remove(pu);
      }
      for (int j = lasers.size()-1; j>=0; j--) {
        Lazer las = lasers.get(j);
        if (pu.collide(las.x, las.y)) {
          PUs.remove(pu);
          powerup=true;
          pTime.start();
        }
      }
    }

    if (keyPressed) { 
      if (key == ' ' && fireCap.isFinished()) {
        lasers.add(new Lazer(friend.x-42, friend.y, 0));
        lasers.add(new Lazer(friend.x+42, friend.y, 0));
        lasers.add(new Lazer(friend.x-62, friend.y, 0));
        lasers.add(new Lazer(friend.x+62, friend.y, 0));
        ding.play();
        fireCap.start();
      }
    }
    if (!flashTime.isFinished()) {
      stroke(255, 40);
      noFill();
      strokeWeight(200);
      quad(0, 0, 0, height, width, height, width, 0);
    }
    if (score>=level*100) {
      rocks.clear();
      lasers.clear();
      gameover=true;
      win=true;
      rocksCleared=true;
    }
    shipX=mouseX;
    friend.display(shipX, height-50, cannonType);
  }
  //UI render
  ui.display();
}
