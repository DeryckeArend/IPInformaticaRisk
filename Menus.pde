float buttonWidth = 400;
float buttonHeight = 75;
float button1Height = 300;
float straal = 30;

//Deze methode zorgt ervoor dat het main menu wordt getekend bij het opstarten van het spel,
void mainMenuSetup(){
  image(background, 0, 0, width, height);
  image(logo, (width/2) - 250, 100, 500, 150);
  stroke(10);
  fill(122, 105, 68, 100);
  rect((width/2) - (buttonWidth/2), button1Height, buttonWidth, buttonHeight);
  rect((width/2) - (buttonWidth/2), button1Height + 100, buttonWidth, buttonHeight);
  rect((width/2) - (buttonWidth/2), button1Height + 200, buttonWidth, buttonHeight);
  rect((width/2) - (buttonWidth/2), button1Height + 300, buttonWidth, buttonHeight);
  rect((width/2) - (buttonWidth/2), button1Height + 400, buttonWidth, buttonHeight);
  
  fill(0);
  textSize(50);
  textAlign(CENTER);
  text("Start Spel", (width/2), button1Height + 50);
  text("Spelregels", (width/2), button1Height + 150);
  text("Opties", (width/2), button1Height + 250);
  text("Credits", (width/2), button1Height + 350);
  text("Afsluiten", (width/2), button1Height + 450);
}



//Deze methode controleert waar de muis is en of je op een rechthoek(knop) klikt
void mainMenu(){
  //Eerst controleren we via de x-as, want alle knoppen hebben dezelfde x-waarden
  if((width/2) - (buttonWidth/2) < mouseX && mouseX < (width/2) + (buttonWidth/2)){
    
    //Eerste knop start spel
    if(button1Height < mouseY && mouseY < (button1Height + buttonHeight) && mousePressed){
      buttonClicked();
      startGame();
      state = "game";
    }
    
    //Tweede knop naar spelregels
    if(button1Height + 100 < mouseY && mouseY < (button1Height + buttonHeight + 100) && mousePressed){
      
    }
    
    //Derde knop naar Opties
    if(button1Height + 200 < mouseY && mouseY < (button1Height + buttonHeight + 200) && mousePressed){
      startOptions();
      state = "optionsMenu";
    }
    
    //Vierde knop naar Credits
    if(button1Height + 300 < mouseY && mouseY < (button1Height + buttonHeight + 300) && mousePressed){
      startCredits();
    }
    
    //Vijfde knop naar game afsluiten
    if(button1Height + 400 < mouseY && mouseY < (button1Height + buttonHeight + 400) && mousePressed){
      //Sluit het programma af
      exit();
    }
  }
}

void startGame(){
  //We maken eerst heel het scherm schoon, door alle knoppen enzo te overschrijven
  background(0);
  //Dan laden we een afbeelding op als achtergrond. Eerst maak je in IPInformaticaRisk een variabele aan bovenaan bij de andere PImage. Dan laad je de afbeelding op in loadImages(), ook in IPInformatica
  image(riskMap, 0, 0, width, height);
  //Maak een knop om terug te keren naar het hoofdmenu
  rect(10,10,200,70);
  for(int i = 0; i < nodes.size(); i++){
    Node n = nodes.get(i);
    noFill();
    ellipse(n.x, n.y, straal, straal);
  }
}

void startOptions(){
  background(0);
  image(background, 0, 0, width, height);
  stroke(10);
  fill(122, 105, 68, 100);
  rect(10, 10, 200, 70);
  //music
  rect((width/2) - (buttonWidth/2), buttonHeight + 400, buttonWidth, buttonHeight);
  //sound (clicks ect)
  rect((width/2) - (buttonWidth/2), buttonHeight + 500, buttonWidth, buttonHeight);
  
  fill(0);
  textSize(50);
  textAlign(CENTER);
  text("Return", 110, 60);
  text("Music", (width/2), button1Height + 225);
  text("Sound", (width/2), button1Height + 325);
}

void startCredits(){
  background(0);
  
}

void returnMenu() {
  if(10 < mouseY && mouseY < 70 && 10 < mouseX && mouseX < 200 && mousePressed){
      mainMenuSetup();
      state = "menu";
    }
}