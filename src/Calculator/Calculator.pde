/*//////////////////////////////////
 2020 Calculator for Programming 1
 Courtney Cannon | Nov 2020
 Colors: NumButtons #FA9AEA #FCB5F1
 //////////////////////////////////*/

// Globals
Button[] numButtons = new Button[11];
Button[] opButtons = new Button[13];
String dVal, op;
boolean left = true;
float l, r, result;
int currentNum = 0;

void setup() {
  size(250, 330); // Compact
  //size(250,330); // Extended
  dVal = "0";
  op = "";
  left = true;
  l = 0.0;
  r = 0.0;
  result = 0.0;
  numButtons[0] = new Button(50, 280, 97, 47, "0", true);
  numButtons[1] = new Button(50, 230, 47, 47, "1", true);
  numButtons[2] = new Button(100, 230, 47, 47, "2", true);
  numButtons[3] = new Button(150, 230, 47, 47, "3", true);
  numButtons[4] = new Button(50, 180, 47, 47, "4", true);
  numButtons[5] = new Button(100, 180, 47, 47, "5", true);
  numButtons[6] = new Button(150, 180, 47, 47, "6", true);
  numButtons[7] = new Button(50, 130, 47, 47, "7", true);
  numButtons[8] = new Button(100, 130, 47, 47, "8", true);
  numButtons[9] = new Button(150, 130, 47, 47, "9", true);
  numButtons[10] = new Button(150, 280, 47, 47, ".", true);
  opButtons[0] = new Button(50, 70, 47, 47, "C", false);
  opButtons[1] = new Button(100, 70, 47, 47, "±", false);
  opButtons[2] = new Button(150, 70, 47, 47, "%", false);
  opButtons[3] = new Button(200, 70, 47, 47, "÷", false);
  opButtons[4] = new Button(200, 130, 47, 47, "x", false);
  opButtons[5] = new Button(200, 180, 47, 47, "-", false);
  opButtons[6] = new Button(200, 230, 47, 47, "+", false);
  opButtons[7] = new Button(200, 280, 47, 47, "=", false);
  opButtons[8] = new Button(0, 70, 47, 47, "x²", false);
  opButtons[9] = new Button(0, 130, 47, 47, "√", false);
  opButtons[10] = new Button(0, 180, 47, 47, "sin", false);
  opButtons[11] = new Button(0, 230, 47, 47, "cos", false);
  opButtons[12] = new Button(0, 280, 47, 47, "Rand", false);
}

void draw() {
  background(#FF0059);

  // Show Calculator Display
  updateDisplay();

  // Display and hover buttons
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].hover();
    numButtons[i].display();
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].hover();
    opButtons[i].display();
  }
}

void updateDisplay() {
  rectMode(CORNER);
  fill(255);
  rect(10, 10, width-20, 50, 8);

  fill(0);
  textAlign(RIGHT);

  // Render Scaling Text
  if (dVal.length()<13) {
    textSize(32);
  } else if (dVal.length()<14) {
    textSize(28);
  } else if (dVal.length()<15) {
    textSize(26);
  } else if (dVal.length()<17) {
    textSize(24);
  } else if (dVal.length()<19) {
    textSize(22);
  } else if (dVal.length()<21) {
    textSize(20);
  } else if (dVal.length()<23) {
    textSize(18);
  } else if (dVal.length()<25) {
    textSize(16);
  } else {
    textSize(14);
  }
  text(dVal, width-15, 50);
}

void mouseReleased() { 
  println(" L:" + l + " R:" + r + " Op:" + op);
  println(" Result:" + result + " Left:" + left);

  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hover && dVal.length() < 20) {
      handleEvent(numButtons[i].val, true);
    }
  }

  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].hover) {
      handleEvent(opButtons[i].val, false);
    }
  }
}
void keyPressed() {
  println("KEY:" + key + "keyCode:" + keyCode);

  if (key == '0' && dVal.length()<20) {
    handleEvent("0", true);
  } else  if (key == '1') {
    handleEvent("1", true);
  } else  if (key == '2') {
    handleEvent("2", true);
  } else  if (key == '3') {
    handleEvent("3", true);
  } else  if (key == '4') {
    handleEvent("4", true);
  } else  if (key == '5') {
    handleEvent("5", true);
  } else  if (key == '6') {
    handleEvent("6", true);
  } else  if (key == '7') {
    handleEvent("7", true);
  } else  if (key == '8') {
    handleEvent("8", true);
  } else  if (key == '9') {
    handleEvent("9", true);
  } else  if (key == '+') {
    handleEvent("+", false);
  } else  if (key == '-') {
    handleEvent("-", false);
  } else  if (key == '*') {
    handleEvent("x", false);
  } else  if (key == '/') {
    handleEvent("÷", false);
  } else if (key == '.') {
    handleEvent(".", false);
  } else if (key == 'C') {
    handleEvent("C", false);
  } else if (key == 10) {
    if (keyCode == ENTER || keyCode == RETURN) {
      handleEvent("=", false);
    }
  } else if (keyCode == 27) {
    key = 0;
    if (key == 0) {
      handleEvent("C", false);
    }
  }
}

String handleEvent(String val, boolean num) {
  if (left && num) {  // Left Number
    if (dVal.equals("0") || result == l) {
      dVal = (val);
      l = float(dVal);
    } else {
      dVal += (val);
      l = float(dVal);
    }
  } else if (!left && num) {
    if (dVal.equals("0") || result == l) {
      dVal = (val);
      r = float(dVal);
    } else {
      dVal += (val);
      r = float(dVal);
    }
  } else if (val.equals("C")) { // clear button
    dVal = "0";
    result = 0.0;
    left = true;
    r = 0.0;
    l = 0.0;
    op = "";
  } else if (val.equals("+")) {
    if (!left) {
      performCalc();
    } else {
      op = "+";
      left = false;
      dVal = "0";
    }
  } else if (val.equals("-")) {
    op = "-";
    left = false;
    dVal = "0";
  } else if (val.equals("x")) {
    op = "x";
    left = false;
    dVal = "0";
  } else if (val.equals("÷")) {
    op = "÷";
    left = false;
    dVal = "0";
  } else if (val.equals("±")) {
    if (left) {
      l *= -1;
      dVal = str(l);
    } else {
      r *= -1;
      dVal = str(r);
    }
  } else if (val.equals("x²")) {
    if (left) {
      l = sq(l);
      dVal = str(l);
    } else {
      r = sq(r);
      dVal = str(r);
    }
  } else if (val.equals("√")) {
    if (left) {
      l = sqrt(l);
      dVal = str(l);
    } else {
      r = sqrt(r);
      dVal = str(r);
    }
  } else if (val.equals("sin")) {
    if (left) {
      l = sin(radians(l));
      dVal = str(l);
    } else {
      r = sin(radians(r));
      dVal = str(r);
    }
  } else if (val.equals("cos")) {
    if (left) {
      l = cos(radians(l));
      dVal = str(l);
    } else {
      r = cos(radians(r));
      dVal = str(r);
    }
  } else if (val.equals("Rand")) {
    if (left) {
      l = random(0, 1);
      dVal = str(l);
    } else {
      r = random(0, 1);
      dVal = str(r);
    }
  } else if (val.equals(".") && !dVal.contains(".")) {
    dVal += (val);
  } else if (val.equals("=")) {
    performCalc();
  }
  return val;
}



void performCalc() {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("x")) {
    result = l * r;
  } else if (op.equals("÷")) {
    result = l / r;
  }
  l = result;
  dVal = str(result);
  left = true;
}
