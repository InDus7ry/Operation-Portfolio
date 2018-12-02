class Rock {
  //variables

  int x;
  int y;
  float d;
  int v;
  int health;

  //constructors

  Rock (int x, int y, int health) {
    this.x = x;
    this.y = y;
    this.health = health;
  }

  //behaviour
  void display(){
    fill(230);
    ellipse(x, y, 100, 100);
  }
}
