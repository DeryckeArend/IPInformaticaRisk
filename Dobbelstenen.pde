 int diceSize = 150;
 
 void drawDice(){
   background(#39ac39);
   
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
 
 
 