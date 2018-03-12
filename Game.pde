void neighbourNodes(){
  for(Node n: nodes) {
    if(mousePressed && (sqrt(((n.x - mouseX)*(n.x - mouseX)) + ((n.y - mouseY)*(n.y - mouseY))) < straal)){
      drawGame();
      noStroke();
      fill(255,255,255);
      ellipse(n.x,n.y,straal,straal);
      Country c = n.country;
       for(int i = 0; i < c.neighbours.length; i++){
         Node node = getCountry(c.neighbours[i]).node;
         
         if(getCountry(c.neighbours[i]).owner.name.equals(c.owner.name)){
           fill(80, 126, 201);
           ellipse(node.x, node.y, straal, straal);
         }
         if(!getCountry(c.neighbours[i]).owner.name.equals(c.owner.name)){
           fill(204, 79, 102);
           ellipse(node.x, node.y, straal, straal);
         }
       }
     }
  }
}

void drawGame(){
  //We maken eerst heel het scherm schoon, door alle knoppen enzo te overschrijven
  background(0);
  //Dan laden we een afbeelding op als achtergrond. Eerst maak je in IPInformaticaRisk een variabele aan bovenaan bij de andere PImage. Dan laad je de afbeelding op in loadImages(), ook in IPInformatica
  image(riskMap, 0, 0, width, height);
  for(int i = 0; i < nodes.size(); i++){
    Node n = nodes.get(i);
    fill(0);
    ellipse(n.x, n.y, straal, straal);
  }
  drawSoldier();
  drawSidebar();
}

void drawSoldier(){
 for(Node n: nodes){
  image(soldier,n.x + 7, n.y, 50, 60);
  textSize(25);
  text(5, n.x + 30, n.y);
  }
}

void drawSidebar() {
  int yPos = 100;
  int yPosT = 130;
  int playerTurn = 4;
  
  strokeWeight(3);
    
  for (int i = 0; i < playerAmount; i++) {
    if (i == playerTurn - 1) {
      strokeWeight(10);
    }
    else {
      strokeWeight(3);
    }
      fill(255);
      stroke(100);
      rect(1600, yPos, 300, 125, 30);
      
      fill(0);
      textAlign(CENTER);
      textSize(25);
      text("egon", 1750, yPosT);
      
      textAlign(LEFT);
      textSize(20);
      text("Points: ", 1620, yPosT + 30);
      text("Countries: ", 1620, yPosT + 70);
      
      textAlign(RIGHT);
      text("100", 1880, yPosT + 30);
      text("10", 1880, yPosT + 70);
      
      fill(255);
      yPos += 150;
      yPosT += 150;
  }
}

void loadPlayers(){
  
}