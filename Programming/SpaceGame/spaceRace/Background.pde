class Background {
  //variables

  color colour;
  int star;

  //constructors

  Background(int star, color colour) {
    this.star = star;
    this.colour = colour;
  }



  //Behaviour
  void display() {
    background(colour);
    for(int i=0; i<star; i++){
      strokeWeight(5);
      stroke(255);
      point(random(width), random(height));
    }
  }
}
