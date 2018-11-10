//Calculator
//Gabe Wong (2018)
Button[] btnReal = new Button[10];
Button[] btnOp = new Button[20];
String strVal1, strVal2, strDisp;
char chOpVal;
float running;
boolean firstNum, stanOps;
PFont robot, arial;

void setup() {
  size(800, 800);
  robot = createFont("Roboto-Medium.ttf", 40);
  strDisp = "";
  strVal1 = "";
  strVal2 = "";
  chOpVal = ' ';
  running = 0.0;
  firstNum = true;
  placeReals();
  placeOperators();
}
void draw() {
  background(255);
  stroke(0);
  grid(100);
  noStroke();
  fill(255);
  rectMode(CORNER);
  rect(0, 0, 500, 200);
  for (int i=0; i<btnReal.length; i++) {
    btnReal[i].display();
    btnReal[i].hover();
  }
  for (int i=0; i<btnOp.length; i++) {
    btnOp[i].display();
    btnOp[i].hover();
  }

  update();
}

void mouseReleased() {
  for (int i=0; i<btnReal.length; i++) {
    if (btnReal[i].mCheck == true) {
      if (firstNum) {
        strVal1 += str(btnReal[i].v);
        strDisp = strVal1;
      } else {
        strVal2 += str(btnReal[i].v);
        strDisp = strVal1 + chOpVal + strVal2;
      }
    }
  }
  for (int i=0; i<btnOp.length; i++) {
    if (btnOp[i].mCheck==true) {
      if (btnOp[i].op=="+") {
        chOpVal='+';
        strDisp += chOpVal;
        firstNum= !firstNum;
      } else if (btnOp[i].op=="-") {
        chOpVal='-';
        strDisp += chOpVal;
        firstNum= !firstNum;
      } else if (btnOp[i].op=="×") {
        chOpVal='×';
        strDisp += chOpVal;
        firstNum= !firstNum;
      } else if (btnOp[i].op=="÷") {
        chOpVal='÷';
        strDisp += chOpVal;
        firstNum= !firstNum;
      } else if (btnOp[i].op == "CE") {
        strDisp="";
        strVal1="";
        strVal2="";
        running=0.0;
      } else if (btnOp[i].op == "C") {
        if (firstNum) {
          strVal1="";
          strDisp=strVal1;
        } else if (firstNum == false) {
          strVal2="";
          strDisp=strVal2;
        }
      } else if (btnOp[i].op == "=") {
        preformCalc();
      }
    }
  }
}

void preformCalc() {
  if (chOpVal == '+') {
    running = float(strVal1)+float(strVal2);
    strDisp=str(running);
  } else if (chOpVal == '-') {
    running = float(strVal1)-float(strVal2);
    strDisp=str(running);
  } else if (chOpVal == '×') {
    running = float(strVal1)*float(strVal2);
    strDisp=str(running);
  } else if (chOpVal == '÷') {
    running = float(strVal1)/float(strVal2);
    strDisp=str(running);
  } else {
    strDisp=str(running);
  }
  strVal1=str(running);
  strVal2="";
  firstNum=true;
}

void grid(int scale) {
  for (int i=0; i<height/scale; i++) {
    line(0, scale+(i*scale), width, scale+(i*scale));
  }
  for (int i=0; i<width/scale; i++) {
    line(scale+(i*scale), 0, scale+(i*scale), height);
  }
}

void update() {
  textAlign(RIGHT, CENTER);
  textSize(100);
  fill(0);
  text(strDisp, 490, 75);
  textSize(50);
  text(running, width-10, 100);
  text(strVal1, width-10, 200);
  text(strVal2, width-10, 300);
}

void placeReals() {
  for (int i=0; i<btnReal.length; i++) {
    int x=150;
    int y=750;
    int w=100;
    int h=w;
    if (i==0) {
      btnReal[i] = new Button(x, y, w, h, i, color(255), robot);
    }
    if (i>0 && i<4) {
      y=650;
      x=150;
      btnReal[i] = new Button(x+((i-1)*100), y, w, h, i, color(255), robot);
    }
    if (i>=4 && i<7) {
      y=550;
      x=150;
      btnReal[i] = new Button(x+((i-4)*100), y, w, h, i, color(255), robot);
    }
    if (i>=7 &&i<10) {
      y=450;
      x=150;
      btnReal[i] = new Button(x+((i-7)*100), y, w, h, i, color(255), robot);
    }
  }
}



void placeOperators() {
  btnOp[0] = new Button(450, 250, 100, 100, 0, color(255), robot).asOperator("CE");
  btnOp[1] = new Button(450, 350, 100, 100, 0, color(255), robot).asOperator("+");
  btnOp[2] = new Button(450, 450, 100, 100, 0, color(255), robot).asOperator("-");
  btnOp[3] = new Button(450, 550, 100, 100, 0, color(255), robot).asOperator("×");
  btnOp[4] = new Button(450, 650, 100, 100, 0, color(255), robot).asOperator("÷");
  btnOp[5] = new Button(450, 750, 100, 100, 0, color(255), robot).asOperator("=");
  btnOp[6] = new Button(350, 250, 100, 100, 0, color(255), robot).asOperator("tan");
  btnOp[7] = new Button(250, 250, 100, 100, 0, color(255), robot).asOperator("cos");
  btnOp[8] = new Button(150, 250, 100, 100, 0, color(255), robot).asOperator("sin");
  btnOp[9] = new Button(50, 250, 100, 100, 0, color(255), robot).asOperator("x").hasSuperscript("2");
  btnOp[10] = new Button(50, 350, 100, 100, 0, color(255), robot).asOperator("x").hasSuperscript("-1");
  btnOp[11] = new Button(150, 350, 100, 100, 0, color(255), robot).asOperator("(");
  btnOp[12] = new Button(250, 350, 100, 100, 0, color(255), robot).asOperator(")");
  btnOp[13] = new Button(350, 350, 100, 100, 0, color(255), robot).asOperator("C");
  btnOp[14] = new Button(50, 450, 100, 100, 0, color(255), robot).asOperator("log");
  btnOp[15] = new Button(50, 550, 100, 100, 0, color(255), robot).asOperator("ln");
  btnOp[16] = new Button(50, 650, 100, 100, 0, color(255), robot).asOperator("e");
  btnOp[17] = new Button(50, 750, 100, 100, 0, color(255), robot).asOperator("ans");
  btnOp[18] = new Button(250, 750, 100, 100, 0, color(255), robot).asOperator(".");
  btnOp[19] = new Button(350, 750, 100, 100, 0, color(255), robot).asOperator("±");
}
