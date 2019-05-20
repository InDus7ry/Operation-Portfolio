class Ship {
  //variables

  int x;
  int y;
  float d;
  int v;
  int health;
  color cannons;

  //constructors

  Ship (int x, int y, int health) {
    this.x = x;
    this.y = y;
    this.health = health;
  }

  //behaviour
  void display(int x, int y, int cannons) {
    this.x=x;
    this.y=y;
    this.cannons=cannons;
    noStroke();
    fill(cannons);
    quad(x-50, y-35, x-45, y-60, x-40, y-60, x-40, y-35);
    quad(x-70, y-21, x-65, y-46, x-60, y-46, x-60, y-21);
    quad(x+50, y-35, x+45, y-60, x+40, y-60, x+40, y-35);
    quad(x+70, y-21, x+65, y-46, x+60, y-46, x+60, y-21);
    //Body
    fill(230);
    triangle(x-30, y-50, x+30, y-50, x, y+30);
    rectMode(CENTER);
    //Wings
    fill(200);
    quad(x-30, y-50, x, y-10, x-130, y+40, x-100, y);
    quad(x+30, y-50, x, y-10, x+130, y+40, x+100, y);
    //Window
    triangle(x-30, y-50, x-10, y-50, x-10, y-90);
    triangle(x+30, y-50, x+10, y-50, x+10, y-90);
    fill(100, 26, 150);
    rectMode(CORNER);
    rect(x-10, y-90, 20, 40);
  }
}
