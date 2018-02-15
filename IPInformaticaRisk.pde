/**
*Ingenieursproject Informatica 1ste Bachelor 2017-2018
*Arne Callaert
*Egon Vanhoenacker
*Leonie van Renterghem
*Alex Moens
*Arend Derycke
**/

void setup(){
  fullScreen();
  noStroke();
  background(0);
}

void draw(){
  int x = mouseX;
  int y = mouseY;
  tekenCircle(x, y);
}

void tekenCircle(int x, int y){
  if(mousePressed){
    ellipse(x, y, 20, 20);
  }else{ellipse(x,y,10,10);
}
  
}