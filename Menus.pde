float buttonWidth = 400;
float buttonHeight = 75;
float button1Height = 300;
float namenCreditsX = width/2; 
float namenCreditsY = height/2+400;
float straal = 30;

RadioButton r;
RadioButton r2;

int playerAmount = 0;
int AIAmount = 0;

//Deze methode zorgt ervoor dat het main menu wordt getekend bij het opstarten van het spel,
void drawMainMenu(){
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
<<<<<<< HEAD
      buttonClicked();
      startGame();
      state = "game";
=======
      //drawGame();
      drawStartMenu();
      state = "startMenu";
>>>>>>> c48e6fc6ad421a4759269c1c35cc4f057b8a518f
    }
    
    //Tweede knop naar spelregels
    if(button1Height + 100 < mouseY && mouseY < (button1Height + buttonHeight + 100) && mousePressed){
<<<<<<< HEAD
      buttonClicked();
=======
      drawInstructionMenu();
      state="instructionsMenu";
>>>>>>> c48e6fc6ad421a4759269c1c35cc4f057b8a518f
    }
    
    //Derde knop naar Opties
    if(button1Height + 200 < mouseY && mouseY < (button1Height + buttonHeight + 200) && mousePressed){
<<<<<<< HEAD
      buttonClicked();
      startOptions();
=======
      drawOptions();
>>>>>>> c48e6fc6ad421a4759269c1c35cc4f057b8a518f
      state = "optionsMenu";
    }
    
    //Vierde knop naar Credits
    if(button1Height + 300 < mouseY && mouseY < (button1Height + buttonHeight + 300) && mousePressed){
      buttonClicked();
      state = "creditMenu";
    }
    
    //Vijfde knop naar game afsluiten
    if(button1Height + 400 < mouseY && mouseY < (button1Height + buttonHeight + 400) && mousePressed){
      buttonClicked();
      //Sluit het programma af
      exit();
    }
  }
}

void drawOptions(){
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
<<<<<<< HEAD
  
=======
  text("Return", 110, 65);
>>>>>>> c48e6fc6ad421a4759269c1c35cc4f057b8a518f
  text("Music", (width/2), button1Height + 225);
  text("Sound", (width/2), button1Height + 325);
  
  text("Return", 110, 65);
}

void drawCredits(){
  namenCreditsY = namenCreditsY - 10;
  background(0);
  image(background, 0, 0, width, height);
  textMode(CENTER);
  fill(0);
  text("KingBirdy", width/2, namenCreditsY); 
  fill(122, 105, 68, 100);
  rect(10,10,200,70);
  fill(0);
  text("Return", 110, 65);
  
}

void drawInstructionMenu(){
  background(0);
  image(background, 0, 0, width, height);
  stroke(10);
  fill(122,105,68,100);
  rect(10,10,200,70);
  
  fill(0);
  textSize(50);
  textAlign(CENTER);
  text("Return", 110, 65);
  
  textSize(40);
  textAlign(LEFT);
  String d="Het doel: Verover de hele wereld en versla alle tegenstanders.";
  fill(0);
  text(d, width/2 -850, 200);
  String e="Het begin: Iedereen start met een bepaald aantal gebieden en een aantal soldaten. De gebieden zijn willekeurig verdeeld over alle spelers.";
  fill(0);
  text(e, width/2 -850, 250, 1700,700);
  String f="Het verloop: Speler één begint met zijn eerste zet door op zijn eigen land te klikken en erna op een van zijn buren. Dan zal het duel starten, het stopt pas wanneer een van de teams overblijft en dus op het gebied mag blijven staan. Dan mag deze speler nog andere duels starten en/of zijn soldaten verplaatsen. Erna drukt de speler op *volgende speler* als deze klaar is met zijn zet.";
  fill(0);
  text(f,width/2-850, 400, 1700,1500);
  String g="Het duel: Als een duel is gestart door speler één (de aanvaller) tegen speler twee (de verdediger), zullen er dobbelstenen gegooid worden. Het aantal dobbelstenen correspondeert met het aantal soldaten iemand heeft (Max 6 dobbelstenen als er meer dan 6 soldaten zijn). Wanneer er gelijke cijfers worden gegooid wint de verdediger.";
  fill(0);
  text(g,width/2-850, 750, 1700, 1500);
    
}

void returnMenu() {
  if(10 < mouseY && mouseY < 70 && 10 < mouseX && mouseX < 200 && mousePressed){
<<<<<<< HEAD
    buttonClicked();  
    mainMenuSetup();
=======
      drawMainMenu();
>>>>>>> c48e6fc6ad421a4759269c1c35cc4f057b8a518f
      state = "menu";
    }
}

void nextMenu(){
 if((width/2 - 120) < mouseX &&  mouseX < (width/2 + 120) && 800 < mouseY && mouseY < 875 && mousePressed){
   if(playerAmount != 0){
     drawPlayerSelectMenu();
   }
 }
}

void drawStartMenu(){
  background(0);
  image(background, 0, 0, width, height);
  cp5 = new ControlP5(this);
  text("Selecteer de Spel-Instellingen",960,75);
  text("Aantal spelers:", 960, 250);
  text("Aantal computer-spelers:", 960, 500);
  r = cp5.addRadioButton("radioButtonPlayers")
         .setPosition(590,300)
         .setSize(60,60)
         .setColorForeground(color(0))
         .setColorBackground(color(89,68,39))
         .setColorActive(color(0))
         .setColorLabel(color(0))
         .setColorValue(0)
         .setItemsPerRow(5)
         .setSpacingColumn(100)
         .addItem("2",1)
         .addItem("3",2)
         .addItem("4",3)
         .addItem("5",4)
         .addItem("6",5);

  r2 = cp5.addRadioButton("radioButtonAI")
         .setPosition(590,550)
         .setSize(60,60)
         .setColorForeground(color(0))
         .setColorBackground(color(89,68,39))
         .setColorActive(color(0))
         .setColorLabel(color(0))
         .setItemsPerRow(5)
         .setSpacingColumn(100)
         .addItem("1 ",6)
         .addItem("2 ",7)
         .addItem("3 ",8)
         .addItem("4 ",9)
         .addItem("5 ",10);
         
  PFont pfont = createFont("Arial",20,true); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont,60);
  r.setFont(font);
  //.align(ControlP5.CENTER, ControlP5.TOP);
  cp5.setFont(font);
  
  fill(color(89,68,39));
  rect((width/2 -120),800, 240,75);
  fill(0);
  text("Volgende", width/2,850);
}

 void drawPlayerSelectMenu(){
  
 }
 
 void radioButtonPlayers(int a){
   playerAmount = a;
 }
 
  void radioButtonAI(int a){
   AIAmount = a;
 }