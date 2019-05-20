class Background {
  //variables

  color colour;
  boolean set;

  //constructors

  Background( color colour) {
    this.colour = colour;
  }



  //Behaviour
  void display() {
    background(colour);
    for (int i=0; i<stars; i++) {
      strokeWeight(2);
      stroke(255);
      point(backgroundx[i], backgroundy[i]);
    }
  }
}
