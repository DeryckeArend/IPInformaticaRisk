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
  /*
  for(int i = 0; i < nodes.size(); i++){
    Node n = nodes.get(i);
    fill(0);
    ellipse(n.x, n.y, straal, straal);
  }
  drawSoldier();*/
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
  int playerTurn = 1;
  
  strokeWeight(3);
  int i = 0;
  for (Player p : players) {
    if (i == playerTurn - 1) {
      strokeWeight(10);
    }
    else {
      strokeWeight(3);
    }
      fill(p.playerColor);
      stroke(100);
      rect(1600, yPos, 300, 125, 30);
      
      fill(0);
      textAlign(CENTER);
      textSize(25);
      text(p.name, 1750, yPosT);
      
      textAlign(LEFT);
      textSize(20);
      text("Points: ", 1620, yPosT + 30);
      text("Countries: ", 1620, yPosT + 70);
      
      textAlign(RIGHT);
      text(p.points, 1880, yPosT + 30);
      text("10", 1880, yPosT + 70);
      
      fill(255);
      yPos += 150;
      yPosT += 150;
      i++;
  }
}

void loadPlayers(){
  //Na dat er op de 'Volgende' knop wordt gedrukt wordt deze methode opgeroepen
  //Hierin worden de naam van de speler, zijn kleur en de rest opgeladen en opgeslaan
  for(int i = 1; i <= playerAmount; i++){
    Player p = new Player();
    p.name = cp5.get(Textfield.class, "Name player " + i + ":").getText();
    switch( (int) cp5.get(RadioButton.class, "ColorPicker" + i).getValue()){
      case 1:
        p.playerColor = color(183, 42, 42);
      break;
      case 2:
        p.playerColor = color(44, 115, 163);
      break;
      case 3:
        p.playerColor = color(43, 162, 47);
      break;
      case 4:
        p.playerColor = color(219, 221, 73);
      break;
      case 5:
        p.playerColor = color(255,165,0);
      break;
      case 6:
        p.playerColor = color(188, 64, 182);
      break;
      default:
      break;
    }
    p.points = 0;
    p.AI = false;
    players.add(p);
  }
 
}