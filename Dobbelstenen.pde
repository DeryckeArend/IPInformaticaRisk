int diceSize = 75;
int diceRollDuration = 30;
int currentDiceRoll = 0;
boolean shouldUpdate = false;
 
 String drawDice(Node defNode, Node attNode){
   int defSurvivor = 0;
   int attSurvivor = 0;
   
   rectMode(CORNER);
   fill(113, 125, 145);
   rect(460,200,1000,750,50);
   fill(50);
   PFont titleDice =createFont("Showcard Gothic",40);
   textFont(titleDice,40);
   textAlign(CENTER);
   text("Verdediger",(width/2)-350,(height/2)-265); 
   text("Aanvaller",(width/2)+350,(height/2)-265);
   
   //Afhankelijk van het aantal dobbelstenen van de verdediger worden de rechthoekjes en de cirkeltjes getekend in diceMaker
  List<Integer> rollsDef = new ArrayList<Integer>();
   for(int i = 0; i < defNode.soldiers && i < 6; i++){
     int rollDef = (int) random(1,7);
     rollsDef.add(rollDef);
   }   
  Collections.sort(rollsDef, Collections.reverseOrder());
   
  for(int i = 0; i < rollsDef.size(); i++){
    diceMaker(rollsDef.get(i), width/2 - 350, (height/2)-190 + 100*i, defNode.country.owner.playerColor);   
  }
  
  List<Integer> rollsAtt = new ArrayList<Integer>();
  for(int i= 0; i< attNode.soldiers - 1 && i < 6; i++){
     int rollAtt = (int) random(1,7);
     rollsAtt.add(rollAtt);
  }
  Collections.sort(rollsAtt, Collections.reverseOrder());
  
  for(int i = 0; i < rollsAtt.size(); i++){
    diceMaker(rollsAtt.get(i), width/2 + 350, (height/2)-190 + 100*i, attNode.country.owner.playerColor);
  }
  
  if(rollsAtt.size() < rollsDef.size()){
    for (int i = 0; i < rollsAtt.size(); i++){
      if(rollsDef.get(i) >= rollsAtt.get(i)){
        imageMode(CENTER);    
        image(redCross, width/2 + 350, (height/2)-190 + 100*i, 90, 90);
        defSurvivor++;
      }
      if(rollsDef.get(i) < rollsAtt.get(i)){
        imageMode(CENTER);         
        image(redCross, width/2 - 350, (height/2)-190 + 100*i, 90, 90);
        attSurvivor++;
      }
      imageMode(CORNER);
    }
    defSurvivor += rollsDef.size() - rollsAtt.size();
  }
  
  if (rollsAtt.size() > rollsDef.size()){
    for (int i = 0; i < rollsDef.size(); i++){  
      if(rollsDef.get(i) >= rollsAtt.get(i)){
        imageMode(CENTER);    
        image(redCross, width/2 + 350, (height/2)-190 + 100*i, 90, 90);
        defSurvivor++;
      }
      if(rollsDef.get(i) < rollsAtt.get(i)){
       imageMode(CENTER);         
       image(redCross, width/2 - 350, (height/2)-190 + 100*i, 90, 90);
       attSurvivor++;
      }
      imageMode(CORNER);
    }
    attSurvivor += rollsAtt.size() - rollsDef.size();
  }
  
  if (rollsAtt.size() == rollsDef.size()){
    for (int i = 0; i < rollsDef.size(); i++){  
      if(rollsDef.get(i) >= rollsAtt.get(i)){
        imageMode(CENTER);    
        image(redCross, width/2 + 350, (height/2)-190 + 100*i, 90, 90);
        defSurvivor++;
      }
      if(rollsDef.get(i) < rollsAtt.get(i)){
       imageMode(CENTER);         
       image(redCross, width/2 - 350, (height/2)-190 + 100*i, 90, 90);
       attSurvivor++;
      }
      imageMode(CORNER);
    }
  }
  
  rectMode(CENTER);
  rect(width/2, (height/2)+280, 320, 100, 25);
  rect(width/2, (height/2)+160, 320, 100, 25);
  fill(113, 125, 145);
  textSize(25);
  if(defSurvivor != 0){
    textAlign(CENTER);
    text("Verdediger", width/2, (height/2)+150);
  }else{text("Aanvaller", width/2, (height/2)+150);}
  text("heeft gewonnen", width/2, (height/2)+180);
  textSize(40);
  text("Sluiten", width/2, (height/2)+300);
  rectMode(CORNER);
  
  PFont ingameText = createFont("arial", 25); 
  textFont(ingameText, 25);
  return (defSurvivor + "," + attSurvivor);
 }
  
 void diceMaker(int side, int x, int y, color c){
   //backgroundDice
   noStroke();
   fill(c);
   rectMode(CENTER);
   rect(x, y, diceSize, diceSize, diceSize/5);
   rectMode(CORNER);   
   fill(50);
   
   if (side == 1 || side == 3|| side ==5){
     ellipse(x, y, diceSize/5, diceSize/5);
   }
   if (side == 2 || side == 3 || side == 4 || side == 5 || side == 6) {
     ellipse(x - diceSize/4, y - diceSize/4, diceSize/5, diceSize/5);
     ellipse(x + diceSize/4, y + diceSize/4, diceSize/5, diceSize/5);
   }
   if (side == 4 || side == 5 || side ==6){ 
     ellipse(x + diceSize/4, y - diceSize/4, diceSize/5, diceSize/5);
     ellipse(x - diceSize/4, y + diceSize/4, diceSize/5, diceSize/5);
   }
   if (side == 6){
     ellipse(x + diceSize/4, y, diceSize/5, diceSize/5);
     ellipse(x - diceSize/4, y, diceSize/5, diceSize/5);
   }
 }
 
 void diceUpdate(Node defNode, Node attNode){
   rectMode(CORNER);
   fill(113, 125, 145);
   rect(460,200,1000,750,50);
   fill(50);
   PFont titleDice =createFont("Showcard Gothic",40);
   textFont(titleDice,40);
   textAlign(CENTER);
   text("Verdediger",(width/2)-350,(height/2)-265); 
   text("Aanvaller",(width/2)+350,(height/2)-265);
   
   List<Integer> rollsDef = new ArrayList<Integer>();
   for(int i = 0; i < defNode.soldiers && i < 6; i++){
     int rollDef = (int) random(1,7);
     rollsDef.add(rollDef);
   }   
   
  for(int i = 0; i < rollsDef.size(); i++){
    diceMaker(rollsDef.get(i), width/2 - 350, (height/2)-190 + 100*i, defNode.country.owner.playerColor);   
  }
  
  List<Integer> rollsAtt = new ArrayList<Integer>();
  for(int i= 0; i< attNode.soldiers - 1 && i < 6; i++){
     int rollAtt = (int) random(1,7);
     rollsAtt.add(rollAtt);
  }
  
  for(int i = 0; i < rollsAtt.size(); i++){
    diceMaker(rollsAtt.get(i), width/2 + 350, (height/2)-190 + 100*i, attNode.country.owner.playerColor);
  }
 }
 