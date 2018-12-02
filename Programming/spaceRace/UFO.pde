class UFO {
  //variables

  int x;
  int y;
  float d;
  int v;
  int health;

  //constructors

  UFO (int x, int y, int health) {
    this.x = x;
    this.y = y;
    this.health = health;
  }

  //behaviour
  void display(){
    fill(128);
    rect(x, y, 100, 100);
  }
}
