//De variabelen voor de knoppen in het hoofdmenu
float buttonWidth = 400;
float buttonHeight = 75;
float button1Height = height/2-240;
float namenCreditsX = width/2; 
float namenCreditsY = height/2 + 900;
float straal = 20;

//De variabelen voor de radiobuttons, ze staan hier zodat ze globaal zouden zijn
RadioButton r;
RadioButton rcp1;
RadioButton rcp2;
RadioButton rcp3;
RadioButton rcp4;
RadioButton rcp5;
RadioButton rcp6;

//De variabelen voor de slider
float x = 750;
float y = 540;
float w = 20;
float h = 20;
float initialX = 650;
float higherX = 1250;
float value2 = 0.16;
boolean lock = false;

//De variabelen voor de textfields in het playerSelectMenu
Textfield t;
Textfield t1;
Textfield t2;
Textfield t3;
Textfield t4;
Textfield t5;
Textfield t6;

//Deze methode zorgt ervoor dat het main menu wordt getekend bij het opstarten van het spel,
void drawMainMenu(){
  image(background, 0, 0, width, height);
  image(logo, (width/2) - 250, height/2-440, 500, 150);
  stroke(10);
  fill(122, 105, 68, 100);
  rectMode(CORNER);
  strokeWeight(2);
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


void drawOptionsMenu(){
  image(background, 0, 0, width, height);
  stroke(10);
  fill(122, 105, 68, 100);
  rect(10, 10, 200, 70);
  fill(0);
  textSize(50);  
  textAlign(CENTER);
  text("Terug", 110, 65);
}  

void drawSliderBox() {
  noStroke();
  fill(206,169,99,50);
  rectMode(CORNER);
  if(soundActive){
    rect(width/2-480,height/2-40,920,80);
  }
  else{
    image(sliderBackground,width/2-480,height/2-40);
  }
}

void drawCreditsMenu(){
  namenCreditsY = namenCreditsY - 1;
  background(0);
  image(background, 0, 0, width, height);
  textAlign(CENTER);
  fill(255);
  textSize(50);
  text("Credits:", width/2, namenCreditsY-100);
  textAlign(RIGHT);
  textSize(35);
  text("Code van het spel:", width/2-100, namenCreditsY+100);
  textAlign(LEFT);
  text("Arend Derycke", width/2+100, namenCreditsY+100);
  text("Egon Vanhoenacker", width/2+100, namenCreditsY+150);
  text("Arne Callaert", width/2+100, namenCreditsY+200);
  text("Alex Moens", width/2+100, namenCreditsY+250);
  text("Leonie Van Renterghem", width/2+100, namenCreditsY+300);
  
  textAlign(RIGHT);
  text("Kaart:", width/2-100, namenCreditsY+400);
  textAlign(LEFT);
  text("Alex Moens", width/2+100, namenCreditsY+400);
  text("Egon Vanhoenacker", width/2+100, namenCreditsY+450);
  text("Arne Callaert", width/2+100, namenCreditsY+500);
  text("Arend Derycke", width/2+100, namenCreditsY+550);
  text("Leonie Van Renterghem", width/2+100, namenCreditsY+600);
  
  textAlign(RIGHT);
  text("Muziek:", width/2-100, namenCreditsY+700);
  textAlign(LEFT);
  text("Naruto Shippuden", width/2+100, namenCreditsY+700);
  text(" - Departure To The Front Lines", width/2+100, namenCreditsY+750);
  
  fill(122, 105, 68, 100);
  rect(10,10,200,70);
  fill(0);
  textSize(50);
  textAlign(CENTER);
  text("Terug", 110, 65);
  
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
  text("Terug", 110, 65);
  
  fill(255);
  textSize(35);
  textAlign(LEFT);
  String d="Het doel: Verover de hele wereld en versla alle tegenstanders.";
 // fill(255);
  text(d, width/2 -650, 100);
  String e="Het begin: Iedereen start met een bepaald aantal gebieden en een aantal soldaten. De gebieden zijn willekeurig verdeeld over alle spelers.";
  //fill(255);
  text(e, width/2 -650, 150, 1440,700);
  String f="Het verloop: Speler één begint met zijn eerste zet door op zijn eigen land te klikken en erna op een van zijn buren. Dan zal het duel starten, het stopt pas wanneer een van de teams overblijft en dus op het gebied mag blijven staan. Dan mag deze speler nog andere duels starten en/of zijn soldaten verplaatsen. Erna drukt de speler op *volgende speler* als deze klaar is met zijn zet.";
 // fill(0);
  text(f,width/2-650, 300, 1440,1500);
  String g="Het duel: Als een duel is gestart door speler één (de aanvaller) tegen speler twee (de verdediger), zullen er dobbelstenen gegooid worden. Het aantal dobbelstenen correspondeert met het aantal soldaten iemand heeft (Max 6 dobbelstenen als er meer dan 6 soldaten zijn). Wanneer er gelijke cijfers worden gegooid wint de verdediger.";
 // fill(0);
  text(g,width/2-650, 600, 1440, 1500);
    
}


void drawStartMenu(){
  background(0);
  image(background, 0, 0, width, height);
  cp5 = new ControlP5(this);
  textAlign(CENTER);
  textSize(45);
  text("Selecteer de Spel-Instellingen",width/2,height/2-465);
  text("Aantal spelers:", width/2, height/2-290);
  //text("Aantal computer-spelers:", 960, 500);
  r = cp5.addRadioButton("radioButtonPlayers")
         .setPosition(width/2-370,height/2-240)
         .setSize(60,60)
         .setColorForeground(color(0))
         .setColorBackground(color(89,68,39))
         .setColorActive(color(0))
         .setColorLabel(color(0))
         .setColorValue(0)
         .setItemsPerRow(5)
         .setSpacingColumn(100)
         .addItem("2",2)
         .addItem("3",3)
         .addItem("4",4)
         .addItem("5",5)
         .addItem("6",6);

  PFont pfont = createFont("Arial",20,true); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont,60);
  r.setFont(font);
  //.align(ControlP5.CENTER, ControlP5.TOP);
  cp5.setFont(font);
  
  textSize(50);
  stroke(10);
  fill(89, 68, 39);
  rect((width/2 -130),height/2+260, 260,75);
  fill(0);
  text("Volgende", width/2,height/2+310);
  fill(122, 105, 68, 100);
  rect(10, 10, 200, 70);
  fill(0);
    
  textAlign(CENTER);
  text("Terug", 110, 65);
  
}


void drawPlayerSelectMenu(){
   textSize(45);
   image(background, 0, 0, width, height);
   text("Selecteer de Spel-Instellingen",width/2,height/2-465);
   fill(153);
   rectMode(CENTER);
    cp5 = new ControlP5(this);
    
   //Afhankelijk van het aantal spelers worden de rechthoeken met textfield en color selector gekozen
   switch(playerAmount){
  
    case 2:
    rect(width/4,height/2,480,720,45);
    rect(width/2+width/4,height/2,480,720,45);
    
    prepareTextField(t1, width/2-680,height/2-290, "Naam speler 1:");
    prepareTextField(t2, width/2+280,height/2-290, "Naam speler 2:");

    prepareRadioButton(rcp1,width/2-680,height/2-140,"ColorPicker1");
    prepareRadioButton(rcp2,width/2+280,height/2-140,"ColorPicker2");
    break;
    
    case 3:
    rect(width/4,height/2,450,720,45);
    rect(width/2,height/2,450,720,45);
    rect((width*3)/4,height/2,450,720,45);
    
    prepareTextField(t1, (width/2)-680,height/2-290, "Naam speler 1:");
    prepareTextField(t2, (width/2)-200,height/2-290, "Naam speler 2:");
    prepareTextField(t3, (width/2)+280,height/2-290, "Naam speler 3:");
    
    prepareRadioButton(rcp1,(width/2-680),height/2-90, "ColorPicker1");
    prepareRadioButton(rcp2,(width/2)-200,height/2-90,"ColorPicker2");
    prepareRadioButton(rcp3,(width/2)+280,height/2-90,"ColorPicker3");
    break;
    
    case 4:
    rect(width/4,height/4 + 100,480,360,45);
    rect(width/2+width/4,height/4 + 100,480,360,45);
    rect(width/4, height/4+height/2 -50,480,360,45);
    rect(width/2+width/4,height/2+height/4 -50,480,360,45); 
    
    prepareTextField(t1, width/2-680,height/2-290, "Naam speler 1:");
    prepareTextField(t2, width/2+280,height/2-290, "Naam speler 2:");
    prepareTextField(t3, width/2-680,height/2-290 + height/2 -150, "Naam speler 3:");
    prepareTextField(t4, width/2+280,height/2-290 + height/2 -150, "Naam speler 4:");
    
    prepareRadioButton(rcp1,width/2-680,height/2-142,"ColorPicker1");
    prepareRadioButton(rcp2,width/2+280,height/2-142,"ColorPicker2");
    prepareRadioButton(rcp3,width/2-680,height/2-165 + height/2-127,"ColorPicker3");
    prepareRadioButton(rcp4,width/2+280,height/2-165 + height/2-127,"ColorPicker4");
    
    break;
    case 5:
    rect(width/4,height/4+100,450,360,45);
    rect(width/2,height/4+100,450,360,45);
    rect((width*3)/4,height/4 +100,450,360,45);
    rect(width/4+225, height/4+height/2 -50,480,360,45);
    rect((width*3)/4-225,height/2+height/4 -50,480,360,45); 
    
    prepareTextField(t1, width/2-680,height/2-290, "Naam speler 1:");
    prepareTextField(t2, (width/2)-200,height/2-290, "Naam speler 2:");
    prepareTextField(t3, (width/2)+280,height/2-290, "Naam speler 3:");
    prepareTextField(t3, width/2-460,height/2-290 + height/2 -150, "Naam speler 4:");
    prepareTextField(t4, width/2+50,height/2-290 + height/2 -150, "Naam speler 5:");
    
    prepareRadioButton(rcp1,width/2-680,height/2-142, "ColorPicker1");
    prepareRadioButton(rcp2,(width/2)-200,height/2-142,"ColorPicker2");
    prepareRadioButton(rcp3,(width/2)+280,height/2-142,"ColorPicker3");
    prepareRadioButton(rcp4,width/2-460,height/2-165 + height/2-127,"ColorPicker4");
    prepareRadioButton(rcp5, width/2+50,height/2-165 + height/2-127,"ColorPicker5");
    
    break;
    
    case 6:
    rect(width/4,height/4+100,450,360,45);
    rect(width/2,height/4+100,450,360,45);
    rect((width*3)/4,height/4 +100,450,360,45);
    rect(width/4,height/4+height/2-50,450,360,45);
    rect(width/2,height/4+height/2-50,450,360,45);
    rect((width*3)/4,height/4 +height/2-50,450,360,45);
    
    prepareTextField(t1, width/2-680,height/2-290, "Naam speler 1:");
    prepareTextField(t2, (width/2)-200,height/2-290, "Naam speler 2:");
    prepareTextField(t3, (width/2)+280,height/2-290, "Naam speler 3:");
    prepareTextField(t4, width/2-680,height/2-290+height/2-150, "Naam speler 4:");
    prepareTextField(t5, (width/2)-200,height/2-290+height/2-150, "Naam speler 5:");
    prepareTextField(t6, (width/2)+280,height/2-290+height/2-150, "Naam speler 6:");
    
    prepareRadioButton(rcp1,width/2-680,height/2-142, "ColorPicker1");
    prepareRadioButton(rcp2,(width/2)-200,height/2-142,"ColorPicker2");
    prepareRadioButton(rcp3,(width/2)+280,height/2-142,"ColorPicker3");
    prepareRadioButton(rcp4,width/2-680,height/2-165+height/2-127, "ColorPicker4");
    prepareRadioButton(rcp5,(width/2)-200,height/2-165+height/2-127,"ColorPicker5");
    prepareRadioButton(rcp6,(width/2)+280,height/2-165+height/2-127,"ColorPicker6");

   
  }
  
  //De knop onderaan die ons naar het volgende scherm brengt
  rectMode(CORNER);
  textSize(50);
  stroke(10);
  fill(89, 68, 39);
  rect((width/2 -120),height/2+410, 240,75);
  fill(0);
  text("Volgende", width/2,height-75);
  fill(122, 105, 68, 100);
  rect(10, 10, 200, 70);
  fill(0);
    
  textAlign(CENTER);
  text("Terug", 110, 65);
 }
 
 
 Textfield prepareTextField(Textfield t, int x, int y, String label){
   PFont lettertypeInhoud = createFont("arial", 50);
   PFont lettertypeTitel= createFont("arial",25);
     
   t = cp5.addTextfield(label)
    .setPosition(x,y)
    .setSize(400,90)
    .setColorForeground(color(0))
    .setColorBackground(color(114,113,89))    
    .setColorActive(color(0))
    .setColorLabel(color(0))
    .setColor(255)
    .setFont(lettertypeInhoud)
    .setAutoClear(false);
   
    Label l = t.getCaptionLabel();
    l.setFont(lettertypeTitel);
    l.align(LEFT,ControlP5.TOP_OUTSIDE);
    
    return t;
 }
 
 
 RadioButton prepareRadioButton(RadioButton rc, int x, int y, String label){
        rc = cp5.addRadioButton(label)
         .setPosition(x+90,y-25)
         .setSize(60,60)
         .setColorForeground(color(0))
         .setColorBackground(color(89,68,39))
         .setColorActive(color(0))
         .setColorLabel(color(0))
         .setColorValue(0)
         .setItemsPerRow(3)
         .setSpacingColumn(20)
         .setSpacingRow(20)
         //Hier moet het label aan de kleur worden toegevoegd zodat we geen duplicates hebben
         .addItem("red"+label, 1)
         .addItem("blue"+label, 2)
         .addItem("green"+label, 3)
         .addItem("yellow"+label, 4)
         .addItem("orange"+label, 5)
         .addItem("purple"+label, 6)
         .hideLabels();
         
         rc.getItem(0).setColorBackground(color(183, 42, 42));
         rc.getItem(1).setColorBackground(color(44, 115, 163));
         rc.getItem(2).setColorBackground(color(43, 162, 47));
         rc.getItem(3).setColorBackground(color(219, 221, 73));
         rc.getItem(4).setColorBackground(color(255,165,0));
         rc.getItem(5).setColorBackground(color(188, 64, 182));
         
        fill(0);
        PFont titleColor =createFont("arial",40);
        textFont(titleColor,40);
        text("Kies je kleur:",x+205,y-15);
    
    
   return r;
 }
 
 void radioButtonPlayers(int a){
   playerAmount = a;
 }
 
 void colorSelectPlayer(){
color[] kleuren = new color[playerAmount+1];
 for(int i = 1; i <= playerAmount; i++){
    switch( (int) cp5.get(RadioButton.class, "ColorPicker" + i).getValue()){
      case 1:
        kleuren[i]= color(183, 42, 42);
      break;
      case 2:
        kleuren[i] = color(44, 115, 163);
      break;
      case 3:
        kleuren[i] = color(43, 162, 47);
      break;
      case 4:
        kleuren[i] = color(219, 221, 73);
      break;
      case 5:
        kleuren[i] = color(255, 165, 0);
      break;
      case 6:
        kleuren[i] = color(188, 64, 182);
      break;
      default:
      kleuren[i] =color(153);
      break;
    } 
    
    switch (playerAmount){
     
      case 2:
      rectMode(CENTER);
      fill(kleuren[1]);
      rect(width/4,height/2,480,720,45);
      fill(kleuren[2]);
      rect(width/2+width/4,height/2,480,720,45);
      /*
      fill(0);
      PFont titleColor =createFont("arial",35);
      textFont(titleColor,35);
      text("Kies je kleur:",280+205,400-15);
      text("Kies je kleur:",width/2+280+205,400-15);  
      */
      break;
      
      case 3: 
      rectMode(CENTER);
      fill(kleuren[1]);
      rect(width/4,height/2,450,720,45);
      fill(kleuren[2]);
      rect(width/2,height/2,450,720,45);
      fill(kleuren[3]);
      rect((width*3)/4,height/2,450,720,45);
      /*text("Kies je kleur:",280+205,450-15);
      text("Kies je kleur:",(width/2)+5,450-15);
      */
      break;
      
      case 4:
      rectMode(CENTER);      
      fill(kleuren[1]);
      rect(width/4,height/4 + 100,480,360,45);
      fill(kleuren[2]);
      rect(width/2+width/4,height/4 + 100,480,360,45);
      fill(kleuren[3]);
      rect(width/4, height/4+height/2 -50,480,360,45);
      fill(kleuren[4]);
      rect(width/2+width/4,height/2+height/4 -50,480,360,45); 
      break;
      
      case 5:
      rectMode(CENTER);
      fill(kleuren[1]);
      rect(width/4,height/4+100,450,360,45);
      fill(kleuren[2]);
      rect(width/2,height/4+100,450,360,45);
      fill(kleuren[3]);
      rect((width*3)/4,height/4 +100,450,360,45);
      fill(kleuren[4]);
      rect(width/4+225, height/4+height/2 -50,480,360,45);
      fill(kleuren[5]);
      rect((width*3)/4-225,height/2+height/4 -50,480,360,45);
      break;
      
      case 6:
      rectMode(CENTER);
      fill(kleuren[1]);
      rect(width/4,height/4+100,450,360,45);
      fill(kleuren[2]);
      rect(width/2,height/4+100,450,360,45);
      fill(kleuren[3]);
      rect((width*3)/4,height/4 +100,450,360,45);
      fill(kleuren[4]);
      rect(width/4,height/4+height/2-50,450,360,45);
      fill(kleuren[5]);
      rect(width/2,height/4+height/2-50,450,360,45);
      fill(kleuren[6]);
      rect((width*3)/4,height/4 +height/2-50,450,360,45);
      break;
    }
    rectMode(CORNER);
    fill(0);
 }
}