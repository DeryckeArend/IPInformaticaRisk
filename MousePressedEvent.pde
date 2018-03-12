//Dit is de enige class waarin mousePressed gebruikt mag worden, anders flip ik ... you're warned

int startMenuState = 0;

void mousePressed(){
  
  //Een switch case is hetzelfde als if() maar dan iets korter
  //Hierin vertellen we aan de game in welke stadium we zitten, zo weet hij wat hij moet doen als je bv. klikt op een knop. De variabele gameState wordt hierboven opgeslagen en kan maar een aantal vormen aannemen
  switch(state){
    case("menu"):
      mainMenu();
    break;
    case("optionsMenu"):
      updateSlider();
      returnMenu();
    break;
    case("instructionsMenu"):
      returnMenu();
    break;
    case("creditMenu"):
      drawCreditsMenu();
      returnMenu();
    break;
    case("game"):
      neighbourNodes();
    break;
    case("startMenu"):
      nextMenu();
    break;
    default:
      println("EMERGENCY: THERE'S SOMETHING WRONG WITH THE GAME STATE! CAN'T START GAME");
    break;
  }
  
}

//Deze methode controleert waar de muis is en of je op een rechthoek(knop) klikt in het hoofdmenu
void mainMenu(){
  //Eerst controleren we via de x-as, want alle knoppen hebben dezelfde x-waarden
  if((width/2) - (buttonWidth/2) < mouseX && mouseX < (width/2) + (buttonWidth/2)){
    
    //Eerste knop start spel
    if(button1Height < mouseY && mouseY < (button1Height + buttonHeight)){
      drawGame();
      //drawStartMenu();
      state = "game";

      //buttonClicked();
      //drawGame();
      //state = "game";

      drawStartMenu();
      state = "startMenu";
    }
    
    //Tweede knop naar spelregels
    if(button1Height + 100 < mouseY && mouseY < (button1Height + buttonHeight + 100)){

      buttonClicked();

      drawInstructionMenu();
      state="instructionsMenu";

    }
    
    //Derde knop naar Opties
    if(button1Height + 200 < mouseY && mouseY < (button1Height + buttonHeight + 200)){

      buttonClicked();
      
      drawOptionsMenu();
      updateSlider();
      state = "optionsMenu";
    }
    
    //Vierde knop naar Credits
    if(button1Height + 300 < mouseY && mouseY < (button1Height + buttonHeight + 300)){
      buttonClicked();
      state = "creditMenu";
    }
    
    //Vijfde knop naar game afsluiten
    if(button1Height + 400 < mouseY && mouseY < (button1Height + buttonHeight + 400)){
      buttonClicked();
      //Sluit het programma af
      exit();
    }
  }
}

void returnMenu() {
  if(10 < mouseY && mouseY < 70 && 10 < mouseX && mouseX < 200){
    //Het geluidje
    buttonClicked();  
    drawMainMenu();
    state = "menu";
  }
  if(isOver()) {
    lock = true;
  }
}

void nextMenu(){
 if((width/2 - 120) < mouseX &&  mouseX < (width/2 + 120) && 800 < mouseY && mouseY < 875){
   if(playerAmount != 0 && startMenuState == 0){
     r.remove();
     //r2.remove();
     drawPlayerSelectMenu();
     startMenuState = 1;
   }else if (startMenuState == 1){
     loadPlayers();
     //Dit is tijdelijk, er zou een betere methode moeten zijn.
     try{
       cp5.remove(this);
     }catch(Exception e){
         println("Dit is een " + e.toString() + " exception, dit is normaal.");
       }
     state="game";
     drawGame();
   }
 }
}
  
void mouseReleased() {
    lock = false;
}

void updateSlider(){
  drawOptionsMenu();
  rect(660, 540, 600, 4);
  fill(200);
  rect(x, y-8, 20, 20);
  float my = constrain(mouseX, initialX, higherX);
  if(((x+w >= mouseX) && (mouseX >= x) && (y+h >= mouseY) && (mouseY >= y))) { 
    x = my; 
  }
  float value = map(x, initialX, higherX, 0, 100);
  value2 = map(value, 0, 100, 0.0, 1.0);
  // display text
  fill(255);
  textSize(32);
  textAlign(CENTER);
  text("Sound:", initialX -100, y+10);
  text(int(value) +"%", higherX +100, y+10);    
}

boolean isOver(){
    return (x+w >= mouseX) && (mouseX >= x) && (y+h >= mouseY) && (mouseY >= y);
  }