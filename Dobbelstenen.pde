 int diceSize = 75;
 int defenderDiceX = 450;
 int defenderDiceY = 300;
 int attackerDiceX = 300;
 int attackerDiceY = 300;
 
 void drawDice(int defenderAmount, int attackerAmount){
   fill(113, 125, 145);
   rect(460,200,1000,750,50);
   //Afhankelijk van het aantal dobbelstenen van de verdediger worden de rechthoekjes en de cirkeltjes getekend in diceMaker
  for(int i = 0; i < defenderAmount; i++){
    int roll = int(random(1,7));
    diceMaker(roll, width/2 - 350, 350 + 100*i, color(85, 134, 214));
  }
  
  for(int i = 0; i < attackerAmount; i++){
    int roll = int(random(1,7));
    diceMaker(roll, width/2 + 350, 350 + 100*i, color(183, 42, 42));
  }
  
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
 