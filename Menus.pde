//De variabelen voor de knoppen in het hoofdmenu
float buttonWidth = 400;
float buttonHeight = 75;
float button1Height = 300;
float namenCreditsX = width/2; 
float namenCreditsY = height/2+400;
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
float x = 650;
float y = 540;
float w = 20;
float h = 20;
float initialX = x;
float higherX = 1250;
float value2;
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


void drawOptionsMenu(){
  image(background, 0, 0, width, height);
  stroke(10);
  fill(122, 105, 68, 100);
  rect(10, 10, 200, 70);
  fill(0);
  textSize(50);  
  textAlign(CENTER);
  text("Return", 110, 65);
}  

void drawCreditsMenu(){
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


void drawStartMenu(){
  background(0);
  image(background, 0, 0, width, height);
  cp5 = new ControlP5(this);
  textAlign(CENTER);
  textSize(45);
  text("Selecteer de Spel-Instellingen",960,75);
  text("Aantal spelers:", 960, 250);
  //text("Aantal computer-spelers:", 960, 500);
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
  
  //Aanpassen 
  
  fill(color(89,68,39));
  rect((width/2 -120),800, 240,75);
  fill(0);
  text("Volgende", width/2,850);
}


void drawPlayerSelectMenu(){
   image(background, 0, 0, width, height);
   text("Selecteer de Spel-Instellingen",960,75);
   fill(153);
   rectMode(CENTER);
    cp5 = new ControlP5(this);
    
   //Afhankelijk van het aantal spelers worden de rechthoeken met textfield en color selector gekozen
   switch(playerAmount){
  
    case 2:
    rect(width/4,height/2,480,720,45);
    rect(width/2+width/4,height/2,480,720,45);

    prepareTextField(t1, 280,250, "Name player 1:");
    prepareTextField(t2, width/2+280,250, "Name player 2:");

    prepareRadioButton(rcp1,280,400,"ColorPicker1");
    prepareRadioButton(rcp2,width/2+280,400,"ColorPicker2");
    break;
    
    case 3:
    rect(width/4,height/2,450,720,45);
    rect(width/2,height/2,450,720,45);
    rect((width*3)/4,height/2,450,720,45);
    
    cp5 = new ControlP5(this);
    
    prepareTextField(t1, 280,250, "Name player 1:");
    prepareTextField(t2, (width/2)-200,250, "Name player 2:");
    prepareTextField(t3, (width/2)+280,250, "Name player 3:");
    
    prepareRadioButton(rcp1,280,450, "ColorPicker1");
    prepareRadioButton(rcp2,(width/2)-200,450,"ColorPicker2");
    prepareRadioButton(rcp3,(width/2)+280,450,"ColorPicker3");
    break;
    
    case 4:
    rect(width/4,height/4 + 100,480,360,45);
    rect(width/2+width/4,height/4 + 100,480,360,45);
    rect(width/4, height/4+height/2 -50,480,360,45);
    rect(width/2+width/4,height/2+height/4 -50,480,360,45); 
    
    prepareTextField(t1, 280,250, "Name player 1:");
    prepareTextField(t2, width/2+280,250, "Name player 2:");
    prepareTextField(t3, 280,250 + height/2 -150, "Name player 3:");
    prepareTextField(t4, width/2+280,250 + height/2 -150, "Name player 4:");
    
    prepareRadioButton(rcp1,280,398,"ColorPicker1");
    prepareRadioButton(rcp2,width/2+280,398,"ColorPicker2");
    prepareRadioButton(rcp3,280,375 + height/2-127,"ColorPicker3");
    prepareRadioButton(rcp4,width/2+280,375 + height/2-127,"ColorPicker4");
    
    break;
    case 5:
    rect(width/4,height/4+100,450,360,45);
    rect(width/2,height/4+100,450,360,45);
    rect((width*3)/4,height/4 +100,450,360,45);
    rect(width/4+225, height/4+height/2 -50,480,360,45);
    rect((width*3)/4-225,height/2+height/4 -50,480,360,45); 
    
    prepareTextField(t1, 280,250, "Name player 1:");
    prepareTextField(t2, (width/2)-200,250, "Name player 2:");
    prepareTextField(t3, (width/2)+280,250, "Name player 3:");
    prepareTextField(t3, 500,250 + height/2 -150, "Name player 4:");
    prepareTextField(t4, width/2+50,250 + height/2 -150, "Name player 5:");
    
    prepareRadioButton(rcp1,280,398, "ColorPicker1");
    prepareRadioButton(rcp2,(width/2)-200,398,"ColorPicker2");
    prepareRadioButton(rcp3,(width/2)+280,398,"ColorPicker3");
    prepareRadioButton(rcp4,500,375 + height/2-127,"ColorPicker4");
    prepareRadioButton(rcp5, width/2+50,375 + height/2-127,"ColorPicker5");
    
    break;
    
    case 6:
    rect(width/4,height/4+100,450,360,45);
    rect(width/2,height/4+100,450,360,45);
    rect((width*3)/4,height/4 +100,450,360,45);
    rect(width/4,height/4+height/2-50,450,360,45);
    rect(width/2,height/4+height/2-50,450,360,45);
    rect((width*3)/4,height/4 +height/2-50,450,360,45);
    
    prepareTextField(t1, 280,250, "Name player 1:");
    prepareTextField(t2, (width/2)-200,250, "Name player 2:");
    prepareTextField(t3, (width/2)+280,250, "Name player 3:");
    prepareTextField(t4, 280,250+height/2-150, "Name player 4:");
    prepareTextField(t5, (width/2)-200,250+height/2-150, "Name player 5:");
    prepareTextField(t6, (width/2)+280,250+height/2-150, "Name player 6:");
    
    prepareRadioButton(rcp1,280,398, "ColorPicker1");
    prepareRadioButton(rcp2,(width/2)-200,398,"ColorPicker2");
    prepareRadioButton(rcp3,(width/2)+280,398,"ColorPicker3");
    prepareRadioButton(rcp4,280,375+height/2-127, "ColorPicker4");
    prepareRadioButton(rcp5,(width/2)-200,375+height/2-127,"ColorPicker5");
    prepareRadioButton(rcp6,(width/2)+280,375+height/2-127,"ColorPicker6");

   
  }
  
  //De knop onderaan die ons naar het volgende scherm brengt
  rectMode(CORNER);
  fill(color(89,68,39));
  rect((width/2 -120),950, 240,75);
  fill(0);
  textMode(CENTER);
  text("Volgende", width/2,1005);
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
         .setPosition(x+90,y)
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
 