class Rock {
  //variables

  int x;
  int y;
  int type;
  float d;
  float v;
  int health;
  color c;
  float[] offset = new float[8];
  float[] coordx = new float[4];
  float[] coordy = new float[4];
  float[] slope = new float[4];
  boolean hit;

  //constructors

  Rock (int x, int y, int health, int v) {
    this.x = x;
    this.y = y;
    this.health = health;
    c=color(128, 128, 128);
    this.v=v;
    for (int i=0; i<=7; i++) {
      offset[i] = random(10, health/2);
    }
    coordx[0]= x-offset[0];
    coordx[1]= x+offset[1];
    coordx[2]= x+offset[2];
    coordx[3]= x-offset[3];
    //yval
    coordy[0]= y-offset[4];
    coordy[1]= y-offset[5];
    coordy[2]= y+offset[6];
    coordy[3]= y+offset[7];
    hit=false;
    if (coordx[3]<coordx[0] && coordx[2]<coordx[1]) {
      type=1;
    } else if (coordx[3]<coordx[0] && coordx[2]>coordx[1]) {
      type=2;
    } else if (coordx[3]>coordx[0] && coordx[2]<coordx[1]) {
      type=3;
    } else if (coordx[3]>coordx[0] && coordx[2]>coordx[1]) {
      type=4;
    }
  }

  //behaviour

  void move() {
    y += v;
  }

  void display() {
    //xval
    coordx[0]= x-offset[0];
    coordx[1]= x+offset[1];
    coordx[2]= x+offset[2];
    coordx[3]= x-offset[3];
    //yval
    coordy[0]= y-offset[4];
    coordy[1]= y-offset[5];
    coordy[2]= y+offset[6];
    coordy[3]= y+offset[7];
    
    c = color(health+50);
    
    noStroke();
    
    if (hit) {
      hit = false;
    }

    slope[0]=(coordy[0]-coordy[1])/(coordx[0]-coordx[1]);
    slope[1]=(coordy[1]-coordy[2])/(coordx[1]-coordx[2]);
    slope[2]=(coordy[2]-coordy[3])/(coordx[2]-coordx[3]);
    slope[3]=(coordy[3]-coordy[0])/(coordx[3]-coordx[0]);
    //visible

    fill(c);
    quad(coordx[0], coordy[0], coordx[1], coordy[1], coordx[2], coordy[2], coordx[3], coordy[3]);
    stroke(255);
  }

  boolean reachedBottom() {
    if (y > height+20) { 
      return true;
    } else {
      return false;
    }
  }
  float topCollision(float x) {
    float h=((slope[0])*(x-coordx[0]))+coordy[0];
    return h;
  }
  float rightCollision(float x) {
    float h=((slope[1])*(x-coordx[1]))+coordy[1];
    return h;
  }
  float bottomCollision(float x) {
    float h=((slope[2])*(x-coordx[2]))+coordy[2];
    return h;
  }
  float leftCollision(float x) {
    float h=((slope[3])*(x-coordx[3]))+coordy[3];
    return h;
  }
}
