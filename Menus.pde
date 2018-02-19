float buttonWidth = 400;
float buttonHeight = 75;

void mainMenu(){
  image(background, 0, 0, width, height);
  image(logo, (width/2) - 250, 100, 500, 150);
  stroke(10);
  fill(122, 105, 68, 100);
  rect((width/2) - (buttonWidth/2), 300, buttonWidth, buttonHeight);
  rect((width/2) - (buttonWidth/2), 400, buttonWidth, buttonHeight);
  rect((width/2) - (buttonWidth/2), 500, buttonWidth, buttonHeight);
  rect((width/2) - (buttonWidth/2), 600, buttonWidth, buttonHeight);
  rect((width/2) - (buttonWidth/2), 700, buttonWidth, buttonHeight);
  
}