class Lazer {
  //variables

  int x;
  int y;
  int l;
  float d;
  float v;
  color c;

  //constructors

  Lazer (int x, int y, float d) {
    this.x = x;
    this.y = y;
    this.d = d;
    v=10;
    l=10;
    c=color(10, 240, 0);
  }

  //behaviour
  void fire() {
    y-= v;
  }

  void display() {
    
    noStroke();
    rectMode(CENTER);
    fill(c);
    rect(x, y, 2, 30, 7);
    fill(255);
  }

  boolean reachOut() {
    if (y<-l || y>height || x<-l || x>width) {
      return true;
    } else {
      return false;
    }
  }
}
