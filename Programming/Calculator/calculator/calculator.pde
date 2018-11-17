//Calculator
//Gabe Wong (2018)
Button[] btnReal = new Button[13];
Button[] stanOp = new Button[9];
Button[] frontOp = new Button[8];

String strVal1, strVal2, strDisp;
char chOpVal;
float running, ans;
int displaysize;
boolean firstNum, numPlaced, dec;
PFont robot;

void setup() {
  //debug mode:
  
  //size(800, 800);
  
  //-------------------------
  
  
  size(500, 800);
  robot = createFont("Roboto-Medium.ttf", 40);
  strDisp = "";
  strVal1 = "";
  strVal2 = "";
  chOpVal = ' ';
  displaysize = 100;
  running = 0.0;
  ans=0.0;
  firstNum = true;
  placeReals();
  placeOperators();
}
void draw() {
  btnReal[12] = new Button(50, 750, 100, 100, 0, color(255), robot).asOperator("ans").asConstant(ans);
  background(255);
  stroke(0);
  noStroke();
  fill(255);
  rectMode(CORNER);
  rect(0, 0, 500, 200);
  for (int i=0; i<btnReal.length; i++) {
    btnReal[i].display();
    btnReal[i].hover();
  }
  for (int i=0; i<stanOp.length; i++) {
    stanOp[i].display();
    stanOp[i].hover();
  }
  for (int i=0; i<frontOp.length; i++) {
    frontOp[i].display();
    frontOp[i].hover();
  }
  if (strDisp.length()<9) {
    displaysize =  100;
  } else if (strDisp.length()*displaysize>800) {
    displaysize /=2;
  }
  update();
}

void keyPressed() {
  if (key == '1') {
    kyPrs(true, "1");
  } else if (key == '2') {
    kyPrs(true, "2");
  } else if (key == '3') {
    kyPrs(true, "3");
  } else if (key == '4') {
    kyPrs(true, "4");
  } else if (key == '5') {
    kyPrs(true, "5");
  } else if (key == '6') {
    kyPrs(true, "6");
  } else if (key == '7') {
    kyPrs(true, "7");
  } else if (key == '8') {
    kyPrs(true, "8");
  } else if (key == '9') {
    kyPrs(true, "9");
  } else if (key == '0') {
    kyPrs(true, "0");
  } else if (key == ENTER || key == '=') {
    kyPrs(false, "=");
  } else if (key == '+') {
    kyPrs(false, "+");
  } else if (key == '-') {
    kyPrs(false, "-");
  } else if (key == '*') {
    kyPrs(false, "×");
  } else if (key == '/') {
    kyPrs(false, "÷");
  } else if (key == '^') {
    kyPrs(false, "^");
  } else if (key == '.') {
    kyPrs(false, ".");
  } else if (key == BACKSPACE) {
    kyPrs(false, "back");
  }
}


void mouseReleased() {
  for (int i=0; i<10; i++) {
    if (btnReal[i].mCheck == true) {
      numPlaced=true;
      if (firstNum) {
        strVal1 += str(btnReal[i].v);
        strDisp = strVal1;
      } else if (chOpVal=='[') {
        strVal2 = str(btnReal[i].v);
        strDisp = "log("+strVal1+","+strVal2+")";
      } else {
        strVal2 += str(btnReal[i].v);
        strDisp = strVal1 + chOpVal + strVal2;
      }
    }
  }

  for (int i=10; i<btnReal.length; i++) {
    if (btnReal[i].mCheck == true) {
      numPlaced=true;
      if (firstNum) {
        strVal1 = str(btnReal[i].l);
        strDisp = strVal1;
      } else {
        strVal2 = str(btnReal[i].l);
        strDisp = strVal1 + chOpVal + strVal2;
      }
    }
  }


  for (int i=0; i<frontOp.length; i++) {
    if (frontOp[i].mCheck && numPlaced) {
      if (firstNum) {
        if (frontOp[i].op =="tan") {
          float temp = tan(float(strVal1));
          strVal1 = str(temp);
          strDisp = strVal1;
        } else if (frontOp[i].op =="cos") {
          float temp = cos(float(strVal1));
          strVal1 = str(temp);
          strDisp = strVal1;
        } else if (frontOp[i].op =="sin") {
          float temp = sin(float(strVal1));
          strVal1 = str(temp);
          strDisp = strVal1;
        } else if (frontOp[i].op == "log") {
          float temp = log(float(strVal1))/log(10);
          strVal1 = str(temp);
          strDisp = strVal1;
        } else if (frontOp[i].op =="ln") {
          float temp = log(float(strVal1));
          strVal1 = str(temp);
          strDisp = strVal1;
        } else if (frontOp[i].ex =="2") {
          float temp = sq(float(strVal1));
          strVal1 = str(temp);
          strDisp = strVal1;
        } else if (frontOp[i].ex =="-1") {
          float temp = pow(float(strVal1), -1);
          strVal1 = str(temp);
          strDisp = strVal1;
        } else if (frontOp[i].op =="±") {
          float temp = -1*float(strVal1);
          strVal1 = str(temp);
          strDisp = strVal1;
        }
      } else {
        if (frontOp[i].op =="tan") {
          float temp = tan(float(strVal2));
          strVal2 = str(temp);
          strDisp = strVal1 + chOpVal + strVal2;
        } else if (frontOp[i].op =="cos") {
          float temp = cos(float(strVal2));
          strVal2 = str(temp);
          strDisp = strVal1 + chOpVal + strVal2;
        } else if (frontOp[i].op =="sin") {
          float temp = sin(float(strVal2));
          strVal2 = str(temp);
          strDisp = strVal1 + chOpVal + strVal2;
        } else if (frontOp[i].op == "log") {
          float temp = log(float(strVal2))/log(10);
          strVal2 = str(temp);
          strDisp = strVal1 + chOpVal + strVal2;
        } else if (frontOp[i].op =="ln") {
          float temp = log(float(strVal2));
          strVal2 = str(temp);
          strDisp = strVal1 + chOpVal + strVal2;
        } else if (frontOp[i].ex =="2") {
          float temp = sq(float(strVal2));
          strVal2 = str(temp);
          strDisp = strVal1 + chOpVal + strVal2;
        } else if (frontOp[i].ex =="-1") {
          float temp = pow(float(strVal2), -1);
          strVal2 = str(temp);
          strDisp = strVal1 + chOpVal + strVal2;
        } else if (frontOp[i].op =="±") {
          float temp = -1*float(strVal2);
          strVal2 = str(temp);
          strDisp = strVal1 + chOpVal + strVal2;
        }
      }
    }
  }


  for (int i=0; i<stanOp.length; i++) {
    if (stanOp[i].mCheck && numPlaced && firstNum) {
      if (stanOp[i].op!="=" && stanOp[i].op!="CE" && stanOp[i].op!=".") {
        numPlaced=false;
        if (stanOp[i].op=="+") {
          strDisp += "+";
          chOpVal='+';
          firstNum = false;
        } else if (stanOp[i].op=="-") {
          strDisp += "-";
          chOpVal='-';
          firstNum = false;
        } else if (stanOp[i].op=="×") {
          strDisp += "×";
          chOpVal='×';
          firstNum = false;
        } else if (stanOp[i].op=="÷") {
          strDisp += "÷";
          chOpVal='÷';
          firstNum = false;
        } else if (stanOp[i].op=="^") {
          strDisp += "^";
          chOpVal='^';
          firstNum = false;
        } else if (stanOp[i].op=="log_-") {
          strDisp = "log("+strVal1+",";
          chOpVal='[';
          //logBASE is defined by [
          firstNum=false;
        }
      }
    } 
    if (stanOp[i].mCheck) {
      if (stanOp[i].op=="=" && numPlaced) {
        preformCalc();
      } else if (stanOp[i].op=="CE") {
        strDisp = "";
        strVal1="";
        strVal2="";
        numPlaced=false;
        ans=running;
        running=0;
        firstNum=true;
      } else if (stanOp[i].op==".") {
        if (firstNum) {
          if (strVal1.indexOf(".")== -1) {
            strVal1 += ".";
            strDisp = strVal1;
          }
        } else {
          strVal2 += ".";
          strDisp = strVal2;
        }
      }
    }
  }
}

void preformCalc() {
  if (chOpVal == '+') {
    running = float(strVal1)+float(strVal2);
    strDisp= str(running);
  } else if (chOpVal=='-') {
    running = float(strVal1)-float(strVal2);
    strDisp= str(running);
  } else if (chOpVal=='×') {
    running = float(strVal1)*float(strVal2);
    strDisp= str(running);
  } else if (chOpVal=='÷') {
    running = float(strVal1)/float(strVal2);
    strDisp= str(running);
  } else if (chOpVal=='.') {
    running = float(strVal1)+(float(strVal2))*.1;
    strDisp = str(running);
  } else if (chOpVal=='.') {
    running = float(strVal1)+(float(strVal2))*.1;
    strDisp = str(running);
  } else if (chOpVal=='^') {
    running = pow(float(strVal1), float(strVal2));
    strDisp = str(running);
  } else if (chOpVal=='[') {
    running = log(float(strVal2))/log(float(strVal1));
    strDisp = str(running);
  } else {
    strVal1=strDisp;
  }
  chOpVal=' ';
  strVal1=strDisp;
  strVal2="";
  numPlaced=true;
  firstNum=true;
}
void update() {
  textAlign(RIGHT, CENTER);
  textSize(displaysize);
  fill(0);
  text(strDisp, 490, 75);
  textSize(20);
  
  //debugging code:
  
  //text(running, width-10, 50);
  //text("first:"+strVal1, width-10, 100);
  //text("second:"+strVal2, width-10, 150);
  //text("firstNum:"+str(firstNum), width-10, 200);
  //text("numPlaced:"+str(numPlaced), width-10, 250);
  //text("chOpVal:"+chOpVal, width-10, 300);
  //text("dispsize:"+displaysize, width-10, 350);
  //text("displeng:"+strDisp.length(), width-10, 400);
  
  //----------------------------------------------------------
}

void kyPrs(boolean num, String val) {
  if (num) {
    if (firstNum) {
      strVal1 += val;
      strDisp = strVal1;
    } else {
      strVal2 += val;
      strDisp = strVal1 + chOpVal + strVal2;
    }
  } else {
    if (val == "=") {
      preformCalc();
    } else if (val == ".") {
      if (firstNum) {
        if (strVal1.indexOf(".")== -1) {
          strVal1 += ".";
          strDisp = strVal1;
        }
      } else {
        strVal2 += ".";
        strDisp = strVal2;
      }
    } else if (val == "back") {
      strDisp = "";
      strVal1="";
      strVal2="";
      numPlaced=false;
      ans=running;
      running=0;
      firstNum=true;
    } else {
      chOpVal=val.charAt(0);
      strDisp += chOpVal;
      firstNum=false;
      numPlaced=false;
    }
  }
}













void placeReals() {
  for (int i=0; i<10; i++) {
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
  btnReal[10] = new Button(250, 350, 100, 100, 0, color(255), robot).asOperator("π").asConstant(PI);
  btnReal[11] = new Button(350, 350, 100, 100, 0, color(255), robot).asOperator("e").asConstant(exp(1));
  btnReal[12] = new Button(50, 750, 100, 100, 0, color(255), robot).asOperator("ans").asConstant(ans);
}
void placeOperators() {
  stanOp[0] = new Button(450, 250, 100, 100, 0, color(255), robot).asOperator("CE");
  stanOp[1] = new Button(450, 350, 100, 100, 0, color(255), robot).asOperator("+");
  stanOp[2] = new Button(450, 450, 100, 100, 0, color(255), robot).asOperator("-");
  stanOp[3] = new Button(450, 550, 100, 100, 0, color(255), robot).asOperator("×");
  stanOp[4] = new Button(450, 650, 100, 100, 0, color(255), robot).asOperator("÷");
  stanOp[5] = new Button(450, 750, 100, 100, 0, color(255), robot).asOperator("=");
  stanOp[6] = new Button(150, 350, 100, 100, 0, color(255), robot).asOperator("^");
  stanOp[7] = new Button(50, 550, 100, 100, 0, color(255), robot).asOperator("log_-");
  stanOp[8] = new Button(250, 750, 100, 100, 0, color(255), robot).asOperator(".");

  frontOp[0] = new Button(350, 250, 100, 100, 0, color(255), robot).asOperator("tan");
  frontOp[1] = new Button(250, 250, 100, 100, 0, color(255), robot).asOperator("cos");
  frontOp[2] = new Button(150, 250, 100, 100, 0, color(255), robot).asOperator("sin");
  frontOp[3] = new Button(50, 450, 100, 100, 0, color(255), robot).asOperator("log");
  frontOp[4] = new Button(50, 650, 100, 100, 0, color(255), robot).asOperator("ln");  
  frontOp[5] = new Button(350, 750, 100, 100, 0, color(255), robot).asOperator("±");
  frontOp[6] = new Button(50, 250, 100, 100, 0, color(255), robot).asOperator("x").hasSuperscript("2");
  frontOp[7] = new Button(50, 350, 100, 100, 0, color(255), robot).asOperator("x").hasSuperscript("-1");
}
