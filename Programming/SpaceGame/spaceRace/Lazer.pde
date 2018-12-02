class Lazer {
  //variables

  int x;
  int y;
  float d;
  int v;
  color colour;

  //constructors

  Lazer (int x, int y, float d) {
    this.x = x;
    this.y = y;
    this.d = d;
  }

  //behaviour
  void display() {
    noStroke();
    rectMode(CORNER);
    fill(0, 240, 0);
    rect(x, y, 10, 50, 7);
  }
}
