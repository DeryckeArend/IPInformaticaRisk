//Dit is de enige class waarin mousePressed gebruikt mag worden, anders flip ik ... you're warned

int startMenuState = 0;

void mousePressed(){
  //text("X= " + mouseX + "  " + "Y= " + mouseY, mouseX, mouseY);
  
  if(isOver()) {
    lock = true;
  }
  //Een switch case is hetzelfde als if() maar dan iets korter
  //Hierin vertellen we aan de game in welke stadium we zitten, zo weet hij wat hij moet doen als je bv. klikt op een knop. De variabele gameState wordt hierboven opgeslagen en kan maar een aantal vormen aannemen
  switch(state){
    case("menu"):
      mainMenu();
    break;
    case("optionsMenu"):
      returnMenuOptions();
    break;
    case("instructionsMenu"):
      returnMenu();
    break;
    case("creditMenu"):
      namenCreditsY = height/2+400;
      drawCreditsMenu();
      returnMenu();
    break;
    case("game"):
    if(refAttDis.equals("reinforce")){
      neighbourNodes();
    }if(refAttDis.equals("attack")){
      
    }if(refAttDis.equals("distribute")){
      
    }
    turnSystem();
    quitButton();
    break;
    case("startMenu"):
    if(startMenuState==0){
      nextMenu();
    }else{startGameButton();}
    break;
    case("loadscreen"):
    
    break;
    default:
      println("EMERGENCY: THERE'S SOMETHING WRONG WITH THE GAME STATE! CAN'T START GAME");
    break;
  }
  
}

void turnSystem(){
  if((1550) < mouseX && mouseX < (1850) && (975) < mouseY && mouseY < (1025)){
    if(refAttDis == "reinforce"){
      refAttDis = "attack";
      cp5.remove("plusButton");
      cp5.remove("minusButton");
      for(Node n : nodes){
        n.soldiers = n.soldiers + n.soldiersRenDis;
        n.soldiersRenDis = 0;
      }
    }
    else if(refAttDis == "attack"){
      refAttDis = "distribute";
    }
    else if(refAttDis == "distribute"){
      if(playerTurnInt == playerAmount){
        playerTurnInt = 0;
        globalTurn ++;
      }
      playerTurnInt++;      
      playerTurn = players.get(playerTurnInt - 1);
      refAttDis = "reinforce";
    }
    drawGame();
  }
  
  }

//Deze methode controleert waar de muis is en of je op een rechthoek(knop) klikt in het hoofdmenu
void mainMenu(){
  //Eerst controleren we via de x-as, want alle knoppen hebben dezelfde x-waarden
  if((width/2) - (buttonWidth/2) < mouseX && mouseX < (width/2) + (buttonWidth/2)){
    
    //Eerste knop start spel
    if(button1Height < mouseY && mouseY < (button1Height + buttonHeight)){
      //buttonClicked();
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
      drawSliderBox();
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
}

void returnMenuOptions() {
  if(10 < mouseY && mouseY < 70 && 10 < mouseX && mouseX < 200){
    //Het geluidje
    buttonClicked();  
    drawMainMenu();
    state = "menu";
    stopSound();
    setupSound();
  }
}

void nextMenu(){
 if((width/2 - 120) < mouseX &&  mouseX < (width/2 + 120) && 800 < mouseY && mouseY < 875){
   if(playerAmount != 0){
     r.remove();
     //r2.remove();
     drawPlayerSelectMenu();
     startMenuState = 1;
   }
 }
 if(30 < mouseX && mouseX < 255 && 20 < mouseY && mouseY < 95){
    r.remove(); 
    drawMainMenu();
    state = "menu";
 }
}
  
void mouseReleased() {
    lock = false;   
}

//begin slider event
void updateSlider(){
  drawSliderBox();
  fill(0);
  rect(660, 540, 600, 4);
  fill(200);
  rect(x, y-8, 20, 20);
  drawSliderBox();
  float my = constrain(mouseX, initialX, higherX);
  //((x+w >= mouseX) && (mouseX >= x) && (y+h >= mouseY) && (mouseY >= y))
  if(lock) { 
    x = my; 
  }
  drawSliderBox();
  float value = map(x, initialX, higherX, 0, 100);
  value2 = map(value, 0, 100, 0.0, 1.0);
  // display text
  fill(255);
  textSize(32);
  textAlign(CENTER);
  text("Music:", initialX -100, y+10);
  text(int(value) +"%", higherX +100, y+10);
  drawSliderBox();
}

boolean isOver(){
    return (x+w >= mouseX) && (mouseX >= x) && (y+h >= mouseY) && (mouseY >= y);
}
//end slider event

void startGameButton(){
  if((width/2-120) < mouseX && mouseX < (width/2 + 120) && 950 < mouseY && mouseY < 1025){
     loadPlayers();
     //Dit is tijdelijk, er zou een betere methode moeten zijn.
     try{
       cp5.remove(this);
     }catch(Exception e){
         println("Dit is een " + e.toString() + " exception, dit is normaal.");
       }
     state="game";
     playerTurnInt = 1;
     playerTurn = players.get(0);
     verdeelLanden();
     drawGame();
  }
  if(30 < mouseX && mouseX < 255 && 20 < mouseY && mouseY < 95){
    try{
       cp5.remove(this);
     }catch(Exception e){
         println("Dit is een " + e.toString() + " exception, dit is normaal.");
       }
    drawStartMenu();
    startMenuState=0;
    state = "startMenu";
  }
}
  
void quitButton(){
    if((sqrt(((1870 - mouseX)*(1870 - mouseX)) + ((45 - mouseY)*(45 - mouseY))) < 32.5)){
      rectMode(CORNER);
      fill(206, 169, 99);
      rect(384, 316, 1151, 348);
      textAlign(CENTER);
      fill(0);
      text("Bent u zeker dat u naar het menu wil gaan? ", 959.5, 378);
      rectMode(CENTER);
      fill(0,255,0);
      rect(684, 551.5, 203.5, 75, 25);
      textAlign(CENTER);
      fill(0);
      text("JA", 684, 561.5);
      fill(255,0,0);
      rect(1235, 551.5, 203.5, 75, 25);
      textAlign(CENTER);
      fill(0);
      text("NEE", 1235, 561.5);
    }
}
  
void neighbourNodes(){
  for(Node n: nodes) {
    if((sqrt(((n.x - mouseX)*(n.x - mouseX)) + ((n.y - mouseY)*(n.y - mouseY))) < straal)){
      if(n.country.owner == playerTurn){
        drawGame();
        cp5.remove("plusButton");
        cp5.remove("minusButton");
        drawDistBox(n);
        drawTextDistBox(n);
        activeNode = n;
      }
    }
  }
}