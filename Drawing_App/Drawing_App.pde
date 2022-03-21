/*
Zi Qing Xiong
 2-4
 March 7, 2022
*/
int[] controller = new int[1];

color selectedColour = 0;
color blackBorder = 0;
color whiteBorder = 255;
color strokeRed = 0;

color borderRed = 0;
color borderOrange = 0;
color borderYellow = 0;
color borderGreen = 0;
color borderBlue = 0;
color borderPurple = 0;
color borderOther = 0;
color borderClear = 0;

int clickRed = 1;
int clickOrange = 1;
int clickYellow = 1;
int clickGreen = 1;
int clickBlue = 1;
int clickPurple = 1;
int clickOther = 1;
int clickClear = 1;

//--------------------------------------------------------------------------------------

void setup() {
  size(800, 600);
  background(255);
}

void draw() {
  background();
  colourShadeOranges();
  colours();
  clear();  
  if (clickRed < 0)
    colourShadeReds();
}

void mouseReleased() {
  if (mouseX >= 20 && mouseX <= 70 && mouseY >= 380 && mouseY <= 400) {
    
  }
  
  /*
  clickRed = borderController(20, 50, 380, 20, clickRed, 1);
  if (controller[0] == 1 && clickRed < 0)
    borderRed = whiteBorder;
  else 
    borderRed = blackBorder;
    
  clickOrange = borderController(80, 50, 380, 20, clickOrange, 2);
  if (controller[0] == 2 && clickOrange < 0)
    borderOrange = whiteBorder;
  else
    borderOrange = blackBorder;
    
  clickYellow = borderController(20, 50, 415, 20, clickYellow, 3);
  clickGreen = borderController(80, 50, 415, 20, clickGreen, 4);
  clickBlue = borderController(20, 50, 450, 20, clickBlue, 5);
  clickPurple = borderController(80, 50, 450, 20, clickPurple, 6);
  clickOther = borderController(30, 90, 485, 20, clickOther, 7);
  clickClear = borderController(30, 90, 540, 40, clickClear, 8);
  */
}

int borderController(int x, int w, int y, int h, int click, int num) {
  if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) {
    controller[0] = num;
    return click*-1;
  }
  return click;
}

//--------------------------------------------------------------------------------------

void colourShadeReds() {
  strokeWeight(1);
  stroke(0);
  fill(#FFE8E8);
  circle(47, 140, 40);
  fill(#FFC9C9);
  circle(103, 140, 40);
  fill(#FF6C6C);
  circle(47, 200, 40);
  fill(#FF0303);
  circle(103, 200, 40);
  fill(#AA0000);
  circle(47, 260, 40);
  fill(#711100);
  circle(103, 260, 40);
  fill(#A25243);
  circle(47, 320, 40);
  fill(#C19D96);
  circle(103, 320, 40);
}

void colourShadeOranges() {
  strokeWeight(1);
  stroke(0);
  circle(47, 140, 40);
  circle(103, 140, 40);
  circle(47, 200, 40);
  circle(103, 200, 40);
  circle(47, 260, 40);
  circle(103, 260, 40);
  circle(47, 320, 40);
  circle(103, 320, 40);
}

//--------------------------------------------------------------------------------------

void tactileColours(int x, int w, int y, int h, color i) {
  if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h)
    stroke(whiteBorder);
  else {
    if (i != whiteBorder)
      stroke(blackBorder);
  }
}

void tactileColoursText(int x, int w, int y, int h) {
  if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h)
    fill(255);
  else
    fill(0);
}

void colours() {
  strokeWeight(1);
  stroke(borderRed);
  tactileColours(20, 50, 380, 20, borderRed);
  fill(#FF7164);
  rect(20, 380, 50, 20);
  tactileColoursText(20, 50, 380, 20);
  textSize(13);
  text("reds", 33, 395);

  stroke(borderOrange);
  tactileColours(80, 50, 380, 20, borderOrange);
  fill(#FFC464);
  rect(80, 380, 50, 20);
  tactileColoursText(80, 50, 380, 20);
  textSize(13);
  text("oranges", 83.5, 395);

  stroke(borderYellow);
  tactileColours(20, 50, 415, 20, borderYellow);
  fill(#FFFA64);
  rect(20, 415, 50, 20);
  tactileColoursText(20, 50, 415, 20);
  textSize(13);
  text("yellows", 25, 429);

  stroke(borderGreen);
  tactileColours(80, 50, 415, 20, borderGreen);
  fill(#7FFF7C);
  rect(80, 415, 50, 20);
  tactileColoursText(80, 50, 415, 20);
  textSize(13);
  text("greens", 86.5, 429);

  stroke(borderBlue);
  tactileColours(20, 50, 450, 20, borderBlue);
  fill(#6FD0FF);
  rect(20, 450, 50, 20);
  tactileColoursText(20, 50, 450, 20);
  textSize(13);
  text("blues", 30, 465);

  stroke(borderPurple);
  tactileColours(80, 50, 450, 20, borderPurple);
  fill(#AB90FF);
  rect(80, 450, 50, 20);
  tactileColoursText(80, 50, 450, 20);
  textSize(13);
  text("purples", 83.5, 464);

  stroke(borderOther);
  tactileColours(30, 90, 485, 20, borderOther);
  fill(180);
  rect(30, 485, 90, 20);
  tactileColoursText(30, 90, 485, 20);
  textSize(13);
  text("other", 60, 499.5);
}

//--------------------------------------------------------------------------------------

void clear() {
  strokeWeight(1);
  stroke(borderClear);
  tactileColours(30, 90, 540, 40, borderClear);
  fill(210);
  rect(30, 540, 90, 40);
  tactileColoursText(30, 90, 540, 40);
  textSize(30);
  text("CLEAR", 34, 571);
}

void background() {
  noStroke();
  fill(225);
  rect(0, 0, 150, 600); //vertical
  rect(0, 0, 800, 100); //horizontal
  fill(255);
  rect(20, 20, 110, 60);
  strokeWeight(1);
  stroke(180);
  line(0, 360, 149, 360);
  line(0, 522, 149, 522);
}
