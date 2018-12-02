class Ship {
  //variables

  int x;
  int y;
  float d;
  int v;
  int health;

  //constructors

  Ship (int x, int y, int health) {
    this.x = x;
    this.y = y;
    this.health = health;
  }

  //behaviour
  void display() {
    noStroke();
    fill(244, 166, 65);
    if (mouseY<pmouseY) {
      triangle(x, y+75, x+20, y, x-20, y);
      triangle(x-10, y+75, x+20, y, x-20, y);
      triangle(x+10, y+75, x+20, y, x-20, y);
      triangle(x, y+90, x+5, y, x-5, y);
    }
    fill(244, 226, 66);
    triangle(x+30, y+20, x+25, y-20, x+35, y-20);
    triangle(x-30, y+20, x-25, y-20, x-35, y-20);
    fill(128);
    strokeWeight(1);
    stroke(255);
    triangle(x, y+20, x-25, y+60, x+25, y+60);
    triangle(x-30, y+50, x+30, y+50, x, y-50);
    fill(128, 5, 5);
    bezier(x-30, y+50, x-100, y, x-50, y+50, x, y-50);
    bezier(x, y-50, x+50, y+50, x+100, y, x+30, y+50);
    ellipse(x, y, 20, 20);
    line(x, y-10, x, y-50);
    line(x-15, y+30, x+15, y+30);
    line(x-19, y+35, x+19, y+35);
    line(x-22, y+40, x+22, y+40);
    line(x-26, y+45, x+26, y+45);
    line(x-30, y+50, x+30, y+50);
  }
}
