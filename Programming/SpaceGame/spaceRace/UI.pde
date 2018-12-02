class UI {
  //variables

  boolean winDisp;
  boolean lossDisp;
  int score;
  int health;
  color colour;
  Button Play = new Button (100, 540-150, "Play", 100);
  Button Top = new Button (100, 540, "Top Scores", 100);
  Button Option = new Button (100, 540+150, "Options", 100);
  Button Back = new Button (100, 200, "< Back", 100);
  Button Exit = new Button (100, 540+300, "Exit", 100);

  //constructors
  UI (color colour) {
    this.colour = colour;
  }
  //behaviour
  void display() {

    textFont(courierNew);
    textSize(100);
    fill(colour);
    if (winDisp) {
      cursor(ARROW);
    } else if (lossDisp) {
      cursor(ARROW);
    } else if (Play.clicked) {
      noCursor();
      rcross(70, 70, 15);
      rcross(180, 70, 15);
      rcross(290, 70, 15);
      textAlign(RIGHT, TOP);
      score = 100;
      text("Score:"+score, width-25, 25);
    } else if (Top.clicked) {
      Back.display();
      Back.hover();
      if (Back.clicked) {
        Top.clicked=false;
        Back.clicked=false;
      }
    } else if (Option.clicked) { //<>//
      Back.display();
      Back.hover();
      if (Back.clicked) {
        Option.clicked=false;
        Back.clicked=false;
      }
      Button Starz = new Button(100, 300, "Stars: " + stars, 100);
      Starz.display();
      Starz.hover();
      if (Starz.clicked) {
        if (mouseButton == LEFT) {
          stars++;
        } else if (mouseButton == RIGHT && stars>0) {
          stars--;
        }
        Starz.clicked=false;
      }
    } else {
      Play.display();
      Play.hover();
      Top.display();
      Top.hover();
      Option.display();
      Option.hover();
      Exit.display();
      Exit.hover();
      if(Exit.clicked){
        exit();
      }
    }
  }
  void rcross(int x, int y, int scale) {
    noStroke();
    beginShape();
    vertex(x-scale, y-scale*3);
    vertex(x+scale, y-scale*3);
    vertex(x+scale, y-scale);
    vertex(x+scale*3, y-scale);
    vertex(x+scale*3, y+scale);
    vertex(x+scale, y+scale);
    vertex(x+scale, y+scale*3);
    vertex(x-scale, y+scale*3);
    vertex(x-scale, y+scale);
    vertex(x-scale*3, y+scale);
    vertex(x-scale*3, y-scale);
    vertex(x-scale, y-scale);
    endShape(CLOSE);
  }
}
