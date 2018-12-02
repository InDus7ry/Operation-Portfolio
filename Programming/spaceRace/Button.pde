class Button {
  //variables

  int l;
  int size;
  String text;
  int x;
  int y;
  boolean clicked;


  //constructor

  Button (int x, int y, String text, int size) {
    this.x = x;
    this.y = y;
    this.text = text;
    this.size = size;
  }

  //methods
  void display() {
    textAlign(LEFT, BOTTOM);
    textSize(size);
    text(text, x, y);
  }
  void hover() {
    if (mouseX>x && mouseX<x+findLength() && mouseY<y && mouseY >y-size) {
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
    
    if (mouseX>x && mouseX<x+findLength() && mouseY<y && mouseY >y-size && mousePressed) {
      clicked = true;
    }
  }

  int findLength() {
    l = text.length();
    l = int(l*(size*.6));
    return l;
  }
}
