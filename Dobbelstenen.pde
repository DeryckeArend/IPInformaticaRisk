int diceSize = 75;
 
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
   text("Verdediger",(width/2)-350,275); 
   text("Aanvaller",(width/2)+350,275);
   
   //Afhankelijk van het aantal dobbelstenen van de verdediger worden de rechthoekjes en de cirkeltjes getekend in diceMaker
   
  List<Integer> rollsDef = new ArrayList<Integer>();
   for(int i = 0; i < defNode.soldiers; i++){
     int rollDef = (int) random(1,7);
     rollsDef.add(rollDef);
   }   
  Collections.sort(rollsDef, Collections.reverseOrder());
   
  for(int i = 0; i < rollsDef.size(); i++){
    diceMaker(rollsDef.get(i), width/2 - 350, 350 + 100*i, color(85, 134, 214));   
  }
  
  List<Integer> rollsAtt = new ArrayList<Integer>();
  for(int i= 0; i< attNode.soldiers; i++){
     int rollAtt = (int) random(1,7);
     rollsAtt.add(rollAtt);
  }
  Collections.sort(rollsAtt, Collections.reverseOrder());
  
  for(int i = 0; i < attNode.soldiers; i++){
    diceMaker(rollsAtt.get(i), width/2 + 350, 350 + 100*i, color(183, 42, 42));
  }
  
  if(attNode.soldiers < defNode.soldiers){
  for (int i = 0; i < attNode.soldiers && attNode.soldiers <= 6; i++){
    println(rollsDef.get(i));
  if(rollsDef.get(i) >= rollsAtt.get(i)){
    imageMode(CENTER);    
    image(redCross, width/2 + 350, 350 + 100*i, 90, 90);
    defSurvivor++;
     }
    if(rollsDef.get(i) < rollsAtt.get(i)){
     imageMode(CENTER);         
     image(redCross, width/2 - 350, 350 + 100*i, 90, 90);
     attSurvivor++;
    }
    imageMode(CORNER);
  } 
  }
  
  if (attNode.soldiers >= defNode.soldiers){
  for (int i = 0; i < defNode.soldiers && defNode.soldiers <= 6; i++){  
  if(rollsDef.get(i) >= rollsAtt.get(i)){
    imageMode(CENTER);    
    image(redCross, width/2 + 350, 350 + 100*i, 90, 90);
    defSurvivor++;
     }
    if(rollsDef.get(i) < rollsAtt.get(i)){
     imageMode(CENTER);         
     image(redCross, width/2 - 350, 350 + 100*i, 90, 90);
     attSurvivor++;
    }
    imageMode(CORNER);
  }
  }
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
 