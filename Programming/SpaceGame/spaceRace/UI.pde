class UI { //<>// //<>// //<>// //<>// //<>// //<>//
  //variables

  boolean winDisp;
  boolean lossDisp;
  color colour;
  Button Play = new Button (100, 540-150, "Play", 100);
  Button Top = new Button (100, 540, "Top Scores", 100);
  Button Option = new Button (100, 540+150, "Options", 100);
  Button Back = new Button (100, 200, "< Back", 100);
  Button Exit = new Button (100, 540+300, "Exit", 100);
  Button Again = new Button ((width/2)-180, 660, "Again?", 100);
  Button Next = new Button ((width/2)-180, 660, "Next >>>", 100);

  //constructors
  UI (color colour) {
    this.colour = colour;
    score=0;
  }
  //behaviour
  void display() {
    lossDisp=loss;
    winDisp=win;
    //println("gameover: " +gameover);
    //println("win: " + winDisp);
    //println("loss: " + lossDisp);
    textFont(courierNew);
    textSize(100);
    fill(colour);
    if (gameover) {
      pTime.stop=true;
      //Win Screen
      if (winDisp) {
        cursor(ARROW);
        fill(255);
        textSize(100); 
        textAlign(CENTER);
        text("Score: " + score, width/2, height/2);
        text("You Win!", width/2, 440);
        Next.display();
        Next.hover();
        Back.display();
        Back.hover();
        if (Back.clicked) {
          Back.clicked=false;
          gameover=false;
          Play.clicked=false;
          health=3;
          score=0;
          win=false;
        } else if (Next.clicked) {
          Next.clicked=false;
          gameover=false;
          level++;
          rockRate=rockRate/level;
          timer.totalTime=rockRate;
          health=3;
          score=0;
          win=false;
        }
      } //loss Screen
      else if (lossDisp) {
        rockRate=5000;
        cursor(ARROW);
        fill(255);
        textSize(100); 
        textAlign(CENTER);
        text("Score: " + score, width/2, height/2);
        text("GAME OVER", width/2, 440);
        Again.display();
        Again.hover();
        Back.display();
        Back.hover();
        if (Back.clicked) {
          Back.clicked=false;
          gameover=false;
          Play.clicked=false;
          health=3;
          score=0;
          loss=false;
          level=1;
        } else if (Again.clicked) {
          Again.clicked=false;
          gameover=false;
          health=3;
          score=0;
          loss=false;
          level=1;
        }
      }
    } else if (Play.clicked) {
      noCursor();
      switch(health) {
      case 1:
        rcross(70, 70, 15);
        break;
      case 2:
        rcross(70, 70, 15);
        rcross(180, 70, 15);
        break;
      case 3:
        rcross(70, 70, 15);
        rcross(180, 70, 15);
        rcross(290, 70, 15);
        break;
      }
      textAlign(RIGHT, TOP);
      text("Score:"+score, width-25, 25);
      text("Level "+level, width-25, 125);
      //int temp = 0;
      //if(powerup){
      //  temp=1;
      //} else {
      //  temp=0;
      //}
      //text(temp, width-25, 225);
    } else if (Top.clicked) {
      Back.display();
      Back.hover();
      if (Back.clicked) {
        Top.clicked=false;
        Back.clicked=false;
      }
    } else if (Option.clicked) {
      //draw page elements
      Back.display();
      Back.hover();
      Button Starz = new Button(100, 300, "Stars: " + stars, 100);
      Button Random = new Button(100, 400, "Randomize", 100);
      //Button Cannon = new Button(100, 500, "Cannon Color", 100);
      Starz.display();
      Starz.hover();
      Random.display();
      Random.hover();
      //Cannon.display();
      //Cannon.hover();
      //back button function
      if (Back.clicked) {
        Option.clicked=false;
        Back.clicked=false;
      }
      //star button function
      else if (Starz.clicked) {
        //Mouse1 = ++
        if (mouseButton == LEFT && stars<1000) {
          stars++;
          //Mouse 2 = --
        } else if (mouseButton == RIGHT && stars>0) {
          stars--;
        }
        //reset button
        Starz.clicked=false;
      } else if (Random.clicked) {
        for (int i=0; i<1000; i++) {
          backgroundx[i]=int(random(width));
          backgroundy[i]=int(random(height));
        }
        Random.clicked=false;
      }
      //} else if (Cannon.clicked) {
      //  cannonType = color(random(50, 255), random(50, 255), random(50, 255));

      //}
    } else {
      Play.display();
      Play.hover();
      Top.display();
      Top.hover();
      Option.display();
      Option.hover();
      Exit.display();
      Exit.hover();
      if (Exit.clicked) {
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
