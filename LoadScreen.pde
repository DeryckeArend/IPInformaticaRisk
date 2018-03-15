Bo b1 = new Bo();
Structure s1 = new Structure();
 
int x = 0;
 
float time = millis();
 
void setup() {
  size(displayWidth, displayHeight); //Fullscreen
  frame.setResizable(true);
}
 
void draw() {
  if(time > 3000) {
    startup();
  } else { 
    load();
  }
}
 
class Bo {
  float legsx;
  void bones() {
    legsx = 5;
    stroke(0);
    strokeWeight(2);
    fill(#DECF9A);
    ellipse(width/2, height/2, 10, 10); //Bare bones head
    line(width/2, height/2 + 5, width/2, height/2 + 25); //Bare bones body
    line(width/2, height/2 + 12, width/2 - 5, height/2 + 17); //Bare bones right arm
    line(width/2, height/2 + 12, width/2 + 5, height/2 + 17); //Bare bones left arm
    line(width/2, height/2 + 25, width/2 - legsx, height/2 + 34);
    line(width/2, height/2 + 25, width/2 + legsx, height/2 + 34);
  }  
}
 
class Structure {
  void cave(int westX/*The leftmost boundary of any given cave*/, int eastX/*Rightmost boundary*/, int northY/*Topmost    boundary*/, int southY/*Bottommost boundary*/) {
    float x = random(westX, eastX); //Every cave must be constructed in relation to these random variables
    float y = random(northY, southY); 
    stroke(100);
    strokeWeight(5);
    fill(0);
    bezier(x - 30, y + 30, x, y - 20, x, y - 20, x + 30, y + 30); //Cave entrance
    ellipse(x, y, 40, 40); //Cave
  }
 
void dungeon(int westX, int eastX, int northY, int southY) {
    float x = random(westX, eastX); //Every dungeon must be constructed in relation to these random variables
    float y = random(northY, southY); 
    stroke(100);
    strokeWeight(5);
    fill(0);
    rect(x, y, 50, 50); 
    line(x - 5, y, x + 55, y);
    line(x - 5, y + 50, x + 55, y + 50);
    line(x + 10, y, x + 10, y + 50);
    line(x + 20, y, x + 20, y + 50);
    line(x + 30, y, x + 30, y + 50);
    line(x + 40, y, x + 40, y + 50);
  }
}
 
void startup() {
  background(0); //The void color
  fill(108, 32, 137);
  rect(width/2 - 5000, height/2 - 5000, 10000, 10000);
  b1.bones();
  s1.dungeon(width/2, width/2 + 200, height/2, height/2 + 200); //example cave
  s1.cave(width/2 + 200, width/2 + 400, height/2 + 200, height/2 + 400); //example cave
  noLoop();
}
 
void load() {
  background(0,0,0,255);
  fill(255);
  textSize(60);
  text("Searching for Rest", 100,240);
  textSize(20);
  text("Fez Productions Presents", 103,190);
  fill(255);
  textSize(15);
  text("Copyright Fez Productions", 10,590);
  fill(102,151,234);
  stroke(0);
  quad(0+x,251,24+x,251,24+x,299,0+x,299);
  quad(29+x,251,53+x,251,53+x,299,29+x,299);
  quad(58+x,251,82+x,251,82+x,299,58+x,299);
  fill(0);
  quad(501,250,600,250,600,300,501,300);
  quad(0,250,99,250,99,300,0,300);
  noFill();
  stroke(255);
  quad(100,250,500,250,500,300,100,300);
  stroke(0);
  for(x = x + 5; x > 500; x = 10);
}