void loadScreen() {
  logoWhite = loadImage("data/Images/logoCoNWit.png");
  if(millis() > 3000) {
    startup();
  } else {
    load();
  }
}

void startup() {
  background(0);
  noLoop();
}
 
void load() {
  background(0);
  image(logoWhite,(width/2) - 250,height/2-440, 500, 150);
  fill(255);
  textAlign(CENTER);
  textSize(60);
  text("DMCV presents:",width/2,height/2-190);
  fill(255,0,0);
  textSize(65);
  text("Clash Of Nations",width/2,height/2-90);
  fill(255,255,255);
  textSize(35);
  text("Please wait while we are loading the game...",width/2,height/2-20); 
  textSize(15);
  text("Thank you",width/2, height/2+130);
}