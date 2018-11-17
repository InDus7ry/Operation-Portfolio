class Button {
  //Member Vars

  int x, y, w, h, v;
  float l;
  String op, ex;
  boolean mCheck, clicked, asOperator, hasSuperscript, asConstant;
  color c;
  PFont f;

  //Constructors

  Button(int x, int y, int w, int h, int v, color c, PFont f) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.v = v;
    this.c = c;
    this.f = f;
    mCheck = false;
  }

  Button asOperator(String op) {
    this.op = op;
    asOperator = true;
    return this;
  }

  Button hasSuperscript(String ex) {
    this.ex = ex;
    hasSuperscript = true;
    return this;
  }

  Button asConstant(float l) {
    this.l=l;
    asConstant=true;
    return this;
  }

  //Behaviour
  //Display

  void display() {
    if (clicked) {
      c=color(220);
    } else {
      c=color(255);
    }
    textSize(20);
    if (asOperator) {
      rectMode(CENTER);
      textFont(f);
      textAlign(CENTER, CENTER);
      stroke(0);
      fill(c);
      rect(x, y, w, h);
      fill(0);
      text(op, x, y-10);
      if (hasSuperscript) {
        textAlign(LEFT, CENTER);
        textSize(20);
        text(ex, x+10, y-15);
      }
    } else {
      rectMode(CENTER);
      textFont(f);
      textAlign(CENTER, CENTER);
      stroke(0);
      fill(c);
      rect(x, y, w, h);
      fill(0);
      text(int(v), x, y-10);
      if (hasSuperscript) {
        textAlign(LEFT, CENTER);
        textSize(20);
        text(ex, x+10, y-15);
      }
    }
  }

  //Hover

  void hover() {
    mCheck = mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2;
    clicked=false;
    if (mCheck && mousePressed) {
      clicked = true;
    }
  }
}
