//spaceRace 2018 © Gabe Wong
//TODO:

//Each Char @ 100pt is 60 px wide

//global vars

float deg;
PFont courierNew;

//settings vars

int stars=0;


//static constuctors
UI ui = new UI(color(255, 50, 50));


void setup() {
  size(1920, 1080);
  courierNew = createFont("couriernew.ttf", 20);
}

void draw() {
  Background back = new Background(stars, color(0));
  Ship friend = new Ship(mouseX, mouseY, 100);
  Lazer las1 = new Lazer(mouseX-35, mouseY-110, deg);
  Lazer las2 = new Lazer(mouseX+25, mouseY-110, deg);
  UFO ufo = new UFO(100, 100, 100);
  Rock rock = new Rock(400, 400, 10);
  
  back.display(); //<>//
  ui.display();

  if (ui.Play.clicked) {
    las1.display();
    las2.display();
    ufo.display();
    rock.display();
    friend.display();
  }
}
