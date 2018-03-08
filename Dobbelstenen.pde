 int diceSize = 150;
 int defenderDiceX = 450;
 int defenderDiceY = 300;
 int attackerDiceX = 300;
 int attackerDiceY = 300;
 
 void drawDice(int defenderAmount, int attackerAmount){
   rect(460,200,1000,600,50);
  
  for(int i = 0; i < defenderAmount; i++){
    int roll = int(random(1,7));
    rect(defenderDiceX, defenderDiceY, diceSize, diceSize, 50);
    if (roll == 1 || roll == 3|| roll ==5)
     ellipse(width/2, height/2, diceSize/5, diceSize/5);
     
   if (roll == 2 || roll == 3 || roll == 4 || roll == 5 || roll == 6) {
     ellipse(width/2 - diceSize/4, height/2 - diceSize/4, diceSize/5, diceSize/5);
     ellipse(width/2 + diceSize/4, height/2 + diceSize/4, diceSize/5, diceSize/5);
   }
   if (roll == 4 || roll == 5 || roll ==6){ 
     ellipse(width/2 + diceSize/4, height/2 - diceSize/4, diceSize/5, diceSize/5);
     ellipse(width/2 - diceSize/4, height/2 + diceSize/4, diceSize/5, diceSize/5);
   }
   if (roll == 6){
     ellipse(width/2 + diceSize/4, height/2, diceSize/5, diceSize/5);
     ellipse(width/2 - diceSize/4, height/2, diceSize/5, diceSize/5);
   }
  }
   
   //backgroundDice
   noStroke();
   fill(255,255,255);
   rectMode(CENTER);
   rect(width/2, height/2, diceSize, diceSize, diceSize/5);
   
   //alle mogelijke manieren hoe de dots zich moeten zetten om een cijfer uit te komen
   fill(50);
   int side = int(random(1,7));
   
   if (side == 1 || side == 3|| side ==5)
     ellipse(width/2, height/2, diceSize/5, diceSize/5);
     
   if (side == 2 || side == 3 || side == 4 || side == 5 || side == 6) {
     ellipse(width/2 - diceSize/4, height/2 - diceSize/4, diceSize/5, diceSize/5);
     ellipse(width/2 + diceSize/4, height/2 + diceSize/4, diceSize/5, diceSize/5);
   }
   if (side == 4 || side == 5 || side ==6){ 
     ellipse(width/2 + diceSize/4, height/2 - diceSize/4, diceSize/5, diceSize/5);
     ellipse(width/2 - diceSize/4, height/2 + diceSize/4, diceSize/5, diceSize/5);
   }
   if (side == 6){
     ellipse(width/2 + diceSize/4, height/2, diceSize/5, diceSize/5);
     ellipse(width/2 - diceSize/4, height/2, diceSize/5, diceSize/5);
   }
    if (mousePressed && mouseButton == LEFT)
    noLoop();
 }
 
 void mousePressed() {
   loop();
 }
 
 void dicePlaceholder(){
   
 }
 