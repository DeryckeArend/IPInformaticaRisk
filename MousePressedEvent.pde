//Dit is de enige class waarin mousePressed gebruikt mag worden, anders flip ik ... you're warned

int startMenuState = 0;
boolean menuActive = false;
boolean soundActive = false;

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
    case("tutorial"):
      state = "game";
      drawGame();
    break;
    case("game"):

    if(refAttDis.equals("distribute")){
      distributeNodes();
    }else if(refAttDis.equals("attack")){
      attackNodes();
    }else if(refAttDis.equals("reinforce")){
      reinforceNodes();
    }
    turnSystem();
    quitButton();
    if(menuActive){
      popUp();
    }
    musicButton();
    musicWeg();
    stopSound();
    setupSound();
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

//Het beurtensysteem is opgebouwd uit 3 delen per beurt: "distribute" waar je nieuwe soldaatjes kan plaatsen, "attack" waar je andere spelers kan aanvallen, 
//en "reinforce" waar je de soldaten kan verplaatsen van het ene naar het andere land
void turnSystem(){
  //Dit is de knop waar je op drukt om naar het volgende deel van je beurt te gaan of het einde van je beurt aan te geven
  if((1550) < mouseX && mouseX < (1850) && (975) < mouseY && mouseY < (1025)){
    if(globalTurn != 0){
      if(refAttDis == "distribute"){
        refAttDis = "attack";
        cp5.remove("plusButton");
        cp5.remove("minusButton");
        for(Node n : nodes){
          n.soldiers = n.soldiers + n.soldiersRenDis;
          n.soldiersRenDis = 0;
        }
      }
    
      else if(refAttDis == "attack"){
        refAttDis = "reinforce";
        pointSystem();
      }
    
      else if(refAttDis == "reinforce"){
        if(playerTurnInt == playerAmount){
          playerTurnInt = 0;
          globalTurn ++;
        }
        playerTurnInt++;      
        playerTurn = players.get(playerTurnInt - 1);
        refAttDis = "distribute";
        pointSystem();
      }
      //Hier wordt het scherm opnieuw getekend zodat alle wijzigingen, soldaten die verplaatst zijn enz. kunnen worden getoond
      drawGame();
    }else{
        cp5.remove("plusButton");
        cp5.remove("minusButton");
        for(Node n : nodes){
          n.soldiers = n.soldiers + n.soldiersRenDis;
          n.soldiersRenDis = 0;
        }
        if(playerTurnInt == playerAmount){
          playerTurnInt = 1;
          globalTurn ++;
          playerTurn = players.get(0);
          drawGame();
          return;
        }
      playerTurn = players.get(playerTurnInt);
      playerTurnInt++;
      pointSystem();
      drawGame();
    }
  }
}

//Deze methode controleert waar de muis is en of je op een rechthoek(knop) klikt in het hoofdmenu
void mainMenu(){
  //Eerst controleren we via de x-as, want alle knoppen hebben dezelfde x-waarden
  if((width/2) - (buttonWidth/2) < mouseX && mouseX < (width/2) + (buttonWidth/2)){
    
    //Eerste knop start spel
    if(button1Height < mouseY && mouseY < (button1Height + buttonHeight)){
      buttonClicked();
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
  if(10 < mouseX && mouseX < 200 && 10 < mouseY && mouseY < 80){
    buttonClicked();  
    drawMainMenu();
    state = "menu";
  }
}

void returnMenuOptions() {
  if(10 < mouseX && mouseX < 200 && 10 < mouseY && mouseY < 80){
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
     buttonClicked();
     drawPlayerSelectMenu();
     startMenuState = 1;
   }
 }
 if(10 < mouseX && mouseX < 200 && 10 < mouseY && mouseY < 80){
    r.remove(); 
    buttonClicked();
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
     buttonClicked();
     //Dit is tijdelijk, er zou een betere methode moeten zijn.
     try{
       cp5.remove(this);
     }catch(Exception e){
         println("Dit is een " + e.toString() + " exception, dit is normaal.");
       }
     state="tutorial";
     playerTurnInt = 1;
     playerTurn = players.get(0);
     verdeelLanden();
     drawTutorial();
  }
  if(10 < mouseX && mouseX < 200 && 10 < mouseY && mouseY < 80){
    buttonClicked();
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
      rect(384, 316, 1151, 348, 25);
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
      menuActive = true;
    }
}

void attackNodes(){
  drawGame();
  for(Node n: nodes) {
    n.active = false;
    if(mousePressed && (sqrt(((n.x - mouseX)*(n.x - mouseX)) + ((n.y - mouseY)*(n.y - mouseY))) < straal)){
      Country c = n.country;
      if(n.country.owner == playerTurn){
        for(int i = 0; i < c.neighbours.length; i++){
          Node node = getCountry(c.neighbours[i]).node;
          if(!(getCountry(c.neighbours[i]).owner == c.owner)){
            n.active = true;
            strokeWeight(7);
            stroke(204, 79, 102);
            line(n.x, n.y, node.x, node.y);
            noFill();
            ellipse(node.x, node.y, straal + 5, straal + 5);
          }
        }
      }
    }
  }
}

void reinforceNodes(){
  drawGame();
    for(Node n: nodes) {
      n.active = false;
    if(mousePressed && (sqrt(((n.x - mouseX)*(n.x - mouseX)) + ((n.y - mouseY)*(n.y - mouseY))) < straal)){
      Country c = n.country;
      if(n.country.owner == playerTurn){
        for(int i = 0; i < c.neighbours.length; i++){
          Node node = getCountry(c.neighbours[i]).node;
          if(getCountry(c.neighbours[i]).owner == c.owner){
            n.active = true;
            strokeWeight(7);
            stroke(80, 126, 201);
            line(n.x, n.y, node.x, node.y);
            noFill();
            ellipse(node.x, node.y, straal + 5, straal + 5);
          }
        }
      }
    }
  }
}

void distributeNodes(){
  for(Node n: nodes) {
    n.active = false;
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

void popUp(){
  if(582.75 < mouseX && mouseX < 785.25 && 514 < mouseY && mouseY < 589){
    buttonClicked();  
    drawMainMenu();
    state = "menu";
    menuActive = false;
    startMenuState = 0;
  }
  if(1133.25 < mouseX && mouseX < 1336.75 && 514 < mouseY && mouseY < 589){
    buttonClicked();
    drawGame();
    state = "game";
    menuActive = false;
 }
}

void musicButton(){
  if((sqrt(((1790 - mouseX)*(1790 - mouseX)) + ((45 - mouseY)*(45 - mouseY))) < 32.5)){
      rectMode(CORNER);
      fill(206, 169, 99);
      rect(384, 356, 1151, 348, 25);
      textAlign(CENTER);
      fill(0);
      text("Muziek", 959.5, 418);
      rectMode(CENTER);
      fill(0,255,0);
      rect(959.5, 661.5, 233.5,50, 25);
      textAlign(CENTER);
      fill(0);
      text("Terug", 959.5, 671.5);
      rectMode(CORNER);
      soundActive = true;
    }
}

void musicWeg(){
  if(857.75 < mouseX && mouseX < 1061.25 && 636.5 < mouseY && mouseY < 686.5){
    buttonClicked();
    drawGame();
    state = "game";
    menuActive = false;
    soundActive = false;
    stopSound();
    setupSound();
  }
}