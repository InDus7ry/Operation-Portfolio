class PowerUp {
  //variables

  int x;
  int y;
  int v;

  //constructors

  PowerUp (int x, int y) {
    this.x = x;
    this.y = y;
    v=5;
  }

  //behaviour
  void display(){
    noStroke();
    fill(255, 0, 0);
    rect(x, y, 100, 100);
  }
  
  void move(){
   y+=v;
  }
  
  boolean collide(int b, int a){
    return a<y+50 && b<x+50 && b>x-50;
  }
  boolean bottom(){
    return y>height+50;
  }
}
