/*
Zi Qing Xiong
2-4
March 7, 2022
Paint App
*/

PImage sheep;
PImage rj;
boolean sheepSwitch = false;
boolean rjSwitch = false;
color backColour = 245;

color red1 = #FFE8E8;
color red2 = #FFC9C9;
color red3 = #FF6C6C;
color red4 = #FF0303;
color red5 = #AA0000;
color red6 = #711100;
color red7 = #A25243;
color red8 = #C19D96;

color orange1 = #FFC3A0;
color orange2 = #FFAA55;
color orange3 = #FF860D;
color orange4 = #FF5F03;
color orange5 = #B94400;
color orange6 = #6F3702;
color orange7 = #B27436;
color orange8 = #D88B42;

color yellow1 = #FFFDC4;
color yellow2 = #FEFF1A;
color yellow3 = #FFD500;
color yellow4 = #F7B200;
color yellow5 = #BC8D15;
color yellow6 = #897201;
color yellow7 = #BFAC4F;
color yellow8 = #DBCC90;

color green1 = #EEFFAD;
color green2 = #C4FFAD;
color green3 = #03FF1D;
color green4 = #83C40E;
color green5 = #60810D;
color green6 = #0F5502;
color green7 = #3E8B47;
color green8 = #8AC99D;

color blue1 = #A0FFE6;
color blue2 = #B7F1FF;
color blue3 = #21E7FF;
color blue4 = #6E87BC;
color blue5 = #08416C;
color blue6 = #0041FF;
color blue7 = #077969;
color blue8 = #86C6C2;

color purple1 = #FFB4BE;
color purple2 = #EEC1FF;
color purple3 = #B09BF7;
color purple4 = #5E57A5;
color purple5 = #7005FF;
color purple6 = #310781;
color purple7 = #7E199B;
color purple8 = #EF64FF;

color other1 = 255;
color other2 = #C7BCD1;
color other3 = #9480A5;
color other4 = #B7B7B7;
color other5 = #585858;
color other6 = 0;
color other7 = #744A2E;
color other8 = #B7A396;

color selectedColour = 0;
color blackBorder = 0;
color whiteBorder = 255;
color selectedColourBorder = blackBorder;
color currentLineColour = 255;

color[] colours = new color[7];
color[] colourPalette = new color[8];
int[] colourClicker = new int[8];

int controller = 0;
float sliderX = 200;
float currentStrokeWeight = 2;

//--------------------------------------------------------------------------------------

void setup() {
  size(800, 600);
  background(255);
  for (int i = 0; i < colours.length; i++) {
    colours[i] = blackBorder;
    colourClicker[i] = 1;
    colourPalette[i] = 0;
  }
  sheep = loadImage("MC_Sheep.png");
  rj = loadImage("RJ.png");
}

void draw() {
  background();
  images();
  colours();
  clear();  
  
  if (colourClicker[0] < 0)
    colourShadeReds();
  if (colourClicker[1] < 0)
    colourShadeOranges();
  if (colourClicker[2] < 0)
    colourShadeYellows();
  if (colourClicker[3] < 0)
    colourShadeGreens();
  if (colourClicker[4] < 0)
    colourShadeBlues();
  if (colourClicker[5] < 0)
    colourShadePurples();
  if (colourClicker[6] < 0)
    colourShadeOther();
    
  fill(245);
  if (mouseX >= sliderX - 15 && mouseX <= sliderX + 15 && mouseY >= 35 && mouseY <= 65)
    stroke(currentLineColour);
  else
    stroke(blackBorder);
  circle(sliderX, 50, 30);
  
  fill(currentLineColour);
  stroke(currentLineColour);
  circle(525, 50, map(sliderX, 201, 420, 2, 80));
  currentStrokeWeight = map(sliderX, 200, 420, 2, 80);
}

void mouseDragged() {
  imageMode(CENTER);
  stroke(currentLineColour);
  strokeWeight(currentStrokeWeight);
  if(mouseX >= 150 + currentStrokeWeight/2 && mouseY >= 100 + currentStrokeWeight/2)
    if (rjSwitch == false && sheepSwitch == false)
      line(pmouseX, pmouseY, mouseX, mouseY);
    else if (rjSwitch == true)
      image(rj, pmouseX, pmouseY, currentStrokeWeight, currentStrokeWeight);
    else if (sheepSwitch == true)
      image(sheep, pmouseX, pmouseY, currentStrokeWeight, currentStrokeWeight);
  imageMode(CORNER);  
  slider();
}

void mouseReleased() {
  borderController(20, 50, 380, 20, 0);
  borderController(80, 50, 380, 20, 1);
  borderController(20, 50, 415, 20, 2);
  borderController(80, 50, 415, 20, 3);
  borderController(20, 50, 450, 20, 4);
  borderController(80, 50, 450, 20, 5);
  borderController(30, 90, 485, 20, 6);
  if (mouseX >= 30 && mouseX <= 120 && mouseY >= 540 && mouseY <= 580) {
    fill(255);
    rect(-5, -5, 810, 610);
  }
  
  if(dist(47, 140, mouseX, mouseY) <= 20) 
    currentLineColour = colourPalette[0];
  if(dist(103, 140, mouseX, mouseY) <= 20) 
    currentLineColour = colourPalette[1];
  if(dist(47, 200, mouseX, mouseY) <= 20) 
    currentLineColour = colourPalette[2];
  if(dist(103, 200, mouseX, mouseY) <= 20) 
    currentLineColour = colourPalette[3];
  if(dist(47, 260, mouseX, mouseY) <= 20) 
    currentLineColour = colourPalette[4];
  if(dist(103, 260, mouseX, mouseY) <= 20) 
    currentLineColour = colourPalette[5];
  if(dist(47, 320, mouseX, mouseY) <= 20) 
    currentLineColour = colourPalette[6];
  if(dist(103, 320, mouseX, mouseY) <= 20) 
    currentLineColour = colourPalette[7];
    
  imageMode(CENTER);
  if(mouseX >= 602 && mouseX <= 682 && mouseY >= 10 && mouseY <= 90) {
    if(sheepSwitch == true)
      sheepSwitch = false;
    else {
      sheepSwitch = true;
      rjSwitch = false;
    }
  }
  
  if(mouseX >= 702 && mouseX <= 782 && mouseY >= 10 && mouseY <= 90) {
    if(rjSwitch == true)
      rjSwitch = false;
    else {
      rjSwitch = true;
      sheepSwitch = false;
    }
  }
    
  stroke(currentLineColour);
  strokeWeight(currentStrokeWeight);
  if(mouseX >= 150 + currentStrokeWeight/2 && mouseY >= 100 + currentStrokeWeight/2)
    if (rjSwitch == false && sheepSwitch == false)
      line(pmouseX, pmouseY, mouseX, mouseY);
    else if (rjSwitch == true)
      image(rj, pmouseX, pmouseY, currentStrokeWeight, currentStrokeWeight);
    else if (sheepSwitch == true)
      image(sheep, pmouseX, pmouseY, currentStrokeWeight, currentStrokeWeight);
  imageMode(CORNER);
      
  slider();
}

void borderController(int x, int w, int y, int h, int num) {
  if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) {
    if (selectedColourBorder == blackBorder) {
      for (int i = 0; i < colours.length; i++) {
        colours[i] = blackBorder;
        colourClicker[i] = 1; 
      }
      colours[num] = whiteBorder;
      colourClicker[num] = -1;
    }
  }
}

void slider() {
  if (mouseX >= 200 && mouseX <= 420 && mouseY >= 35 && mouseY <= 65)
    sliderX = mouseX;
}

//--------------------------------------------------------------------------------------

void differentShades(color c1, color c2, color c3, color c4, color c5, color c6, color c7, color c8) {
  fill(c1);
  colourPalette[0] = c1;
  circle(47, 140, 40);
  fill(c2);
  colourPalette[1] = c2;
  circle(103, 140, 40);
  fill(c3);
  colourPalette[2] = c3;
  circle(47, 200, 40);
  fill(c4);
  colourPalette[3] = c4;
  circle(103, 200, 40);
  fill(c5);
  colourPalette[4] = c5;
  circle(47, 260, 40);
  fill(c6);
  colourPalette[5] = c6;
  circle(103, 260, 40);
  fill(c7);
  colourPalette[6] = c7;
  circle(47, 320, 40);
  fill(c8);
  colourPalette[7] = c8;
  circle(103, 320, 40);
}

void colourShadeReds() {
  strokeWeight(1);
  stroke(0);
  differentShades(red1, red2, red3, red4, red5, red6, red7, red8);
}

void colourShadeOranges() {
  strokeWeight(1);
  stroke(0);
  differentShades(orange1, orange2, orange3, orange4, orange5, orange6, orange7, orange8);
}

void colourShadeYellows() {
  strokeWeight(1);
  stroke(0);
  differentShades(yellow1, yellow2, yellow3, yellow4, yellow5, yellow6, yellow7, yellow8);
}

void colourShadeGreens() {
  strokeWeight(1);
  stroke(0);
  differentShades(green1, green2, green3, green4, green5, green6, green7, green8);
}

void colourShadeBlues() {
  strokeWeight(1);
  stroke(0);
  differentShades(blue1, blue2, blue3, blue4, blue5, blue6, blue7, blue8);
}

void colourShadePurples() {
  strokeWeight(1);
  stroke(0);
  differentShades(purple1, purple2, purple3, purple4, purple5, purple6, purple7, purple8);
}

void colourShadeOther() {
  strokeWeight(1);
  stroke(0);
  differentShades(other1, other2, other3, other4, other5, other6, other7, other8);
}

void images() {
  strokeWeight(1);
  stroke(0);
  fill(245);
  tactileColoursImage(700, 80, 10, 80);
  if (rjSwitch == true)
    fill(#D7F0FA);
  square(700, 10, 80);
  fill(245);
  tactileColoursImage(600, 80, 10, 80);
  if (sheepSwitch == true)
    fill(#D7F0FA);
  square(600, 10, 80);
  image(sheep, 602, 12, 76, 76);
  image(rj, 702, 12, 76, 76);
}

//--------------------------------------------------------------------------------------

void tactileColours(int x, int w, int y, int h) {
  if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h)
    stroke(whiteBorder);
}

void tactileColoursCircle(int x, int y) {
  if (dist(x, y, mouseX, mouseY) <= 20)
    stroke(whiteBorder);
}

void tactileColoursText(int x, int w, int y, int h) {
  if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h)
    fill(255);
  else
    fill(0);
}

void tactileColoursImage(int x, int w, int y, int h) {
  if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h)
    fill(#D7F0FA);
  else
    fill(245);
}

void colours() {
  strokeWeight(1);
  stroke(colours[0]);
  tactileColours(20, 50, 380, 20);
  fill(#FF7164);
  rect(20, 380, 50, 20);
  tactileColoursText(20, 50, 380, 20);
  textSize(13);
  text("reds", 33, 395);

  stroke(colours[1]);
  tactileColours(80, 50, 380, 20);
  fill(#FFC464);
  rect(80, 380, 50, 20);
  tactileColoursText(80, 50, 380, 20);
  textSize(13);
  text("oranges", 83.5, 395);

  stroke(colours[2]);
  tactileColours(20, 50, 415, 20);
  fill(#FFFA64);
  rect(20, 415, 50, 20);
  tactileColoursText(20, 50, 415, 20);
  textSize(13);
  text("yellows", 25, 429);

  stroke(colours[3]);
  tactileColours(80, 50, 415, 20);
  fill(#7FFF7C);
  rect(80, 415, 50, 20);
  tactileColoursText(80, 50, 415, 20);
  textSize(13);
  text("greens", 86.5, 429);

  stroke(colours[4]);
  tactileColours(20, 50, 450, 20);
  fill(#6FD0FF);
  rect(20, 450, 50, 20);
  tactileColoursText(20, 50, 450, 20);
  textSize(13);
  text("blues", 30, 465);

  stroke(colours[5]);
  tactileColours(80, 50, 450, 20);
  fill(#AB90FF);
  rect(80, 450, 50, 20);
  tactileColoursText(80, 50, 450, 20);
  textSize(13);
  text("purples", 83.5, 464);

  stroke(colours[6]);
  tactileColours(30, 90, 485, 20);
  fill(180);
  rect(30, 485, 90, 20);
  tactileColoursText(30, 90, 485, 20);
  textSize(13);
  text("other", 60, 499.5);
}

//--------------------------------------------------------------------------------------

void clear() {
  strokeWeight(1);
  stroke(0);
  tactileColours(30, 90, 540, 40);
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
    fill(currentLineColour);
  rect(20, 20, 110, 60);
  if (rjSwitch == true) {
    fill(255);
    image(rj, 50, 25, 50, 50);
  }
  if (sheepSwitch == true) {
    fill(255);
    image(sheep, 50, 25, 50, 50);
  }
  strokeWeight(1);
  stroke(180);
  line(0, 360, 149, 360);
  line(0, 522, 149, 522);
  fill(245);
  
  stroke(0);
  tactileColoursCircle(47, 140);
  circle(47, 140, 40);
  stroke(0);
  tactileColoursCircle(103, 140);
  circle(103, 140, 40);
  stroke(0);
  tactileColoursCircle(47, 200);
  circle(47, 200, 40);
  stroke(0);
  tactileColoursCircle(103, 200);
  circle(103, 200, 40);
  stroke(0);
  tactileColoursCircle(47, 260);
  circle(47, 260, 40);
  stroke(0);
  tactileColoursCircle(103, 260);
  circle(103, 260, 40);
  stroke(0);
  tactileColoursCircle(47, 320);
  circle(47, 320, 40);
  stroke(0);
  tactileColoursCircle(103, 320);
  circle(103, 320, 40);
  
  stroke(0);
  square(700, 10, 80);
  square(600, 10, 80);
  circle(525, 50, 80);
  
  //slider
  rect(170, 20, 280, 60);
  strokeWeight(5);
  stroke(130);
  line(200, 50, 420, 50);
}
