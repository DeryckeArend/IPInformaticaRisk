int xx = width/2;
 
float time = millis();
 
 
void loadScreen() {
  if(millis() > 3000) {
    startup();
  } else { 
    load();
  }
}

void startup() {
  background(0); //The void color
  fill(108, 32, 137);
  rect(width/2 - 5000, height/2 - 5000, width/2, height/2);
  noLoop();
}
 
void load() {
  background(0,0,0,255);
  fill(255);
  textAlign(CENTER);
  textSize(60);
  text("Loading game", width/2,240);
  textSize(20);
  text("DMCV Presents", width/2,185);
  fill(255);
  fill(102,151,234);
  stroke(0);
  quad(width/2-200,349,width/2-200+xx,349,width/2-200+xx,399,width/2-200,399);
  quad(width/2-200,349,width/2-200+xx,349,width/2-200+xx,399,width/2-200,399);
  quad(width/2-200,349,width/2-200+xx,349,width/2-200+xx,399,width/2-200,399);
  fill(0);
  quad(501,250,600,250,600,300,501,300);
  quad(0,250,99,250,99,300,0,300);
  noFill();
  stroke(255);
  rect(width/2-200,350,400,50);
  stroke(0);
  for(xx = xx + 20; xx > width/2+200; xx = width/2-200);
}