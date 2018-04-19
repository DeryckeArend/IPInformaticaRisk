Node activeNode;
Node reinforceNode;
Node activeNode2;
int soldierAmount;
boolean inDiceScreen = false;
boolean inReinforce = false;

void drawGame(){  
  //We maken eerst heel het scherm schoon, door alle knoppen enzo te overschrijven
  background(0);
  noStroke();
  rectMode(CORNER);
  textAlign(CORNER);
  //Dan laden we een afbeelding op als achtergrond. Eerst maak je in IPInformaticaRisk een variabele aan bovenaan bij de andere PImage. Dan laad je de afbeelding op in loadImages(), ook in IPInformatica
  image(riskMap, 0, 0, width, height);
  for(int i = 0; i < nodes.size(); i++){
    Node n = nodes.get(i);
    Country c = n.country;
    color pcolor = c.owner.playerColor;
    fill(pcolor);
    ellipse(n.x, n.y, straal, straal);
  }
  pointSystem();
  drawSoldier();
  drawSidebar();
  
  //De home-button
  noStroke();
  ellipse(width-50, 45, 65, 65);
  image(house, width-75.5, 18, 50, 50);
  
  //De music-button
  ellipse(width-130, 45, 65, 65);
  image(musicOn, width-156.5, 20, 50, 50);
  
}

void attackNodes(){
  for(Node n: nodes) {
    n.active = false;
    if((sqrt(((n.x - mouseX)*(n.x - mouseX)) + ((n.y - mouseY)*(n.y - mouseY))) < straal) && !inDiceScreen){
      drawGame();
      Country c = n.country;
      List<String> neighbours = Arrays.asList(c.neighbours);
      if(n.country.owner == playerTurn){
        for(int i = 0; i < c.neighbours.length; i++){
          Node node = getCountry(c.neighbours[i]).node;
          if(!(getCountry(c.neighbours[i]).owner == c.owner)){
            n.active = true;
            strokeWeight(7);
            stroke(204, 79, 102);
            println(n.country.name);
            println(node.country.name);
            if((n.country.name.equals( "oranje1") && node.country.name.equals("groen3")) || (node.country.name.equals("oranje1") && n.country.name.equals("groen3"))){
              line(getCountry("oranje1").node.x, getCountry("oranje1").node.y, 33, getCountry("oranje1").node.y);
              line(getCountry("groen3").node.x, getCountry("groen3").node.y,1473,getCountry("groen3").node.y);
            }else{
              line(n.x, n.y, node.x, node.y);
            }
            noFill();
            ellipse(node.x, node.y, straal + 5, straal + 5);
            activeNode = n;
          }
        }
      }else if(neighbours.contains(activeNode.country.name) && activeNode.soldiers >= 2){
        inDiceScreen = true;
        activeNode2 = n;
        shouldUpdate = true;
      }
    }
  }
}

void attackResult(Node n){
        String result = drawDice(n,activeNode);
        String[] resultList = result.split(",");
        int defRemaining = Integer.parseInt(resultList[0]);
        int attRemaining = Integer.parseInt(resultList[1]);
        if(activeNode.soldiers > 6){
          activeNode.soldiers = attRemaining + (activeNode.soldiers - 6);
        }else{
          activeNode.soldiers = attRemaining + 1;
        }
        n.soldiers = defRemaining;
        if(defRemaining == 0){
          n.country.owner.countries--;
          n.country.owner = activeNode.country.owner;
          n.soldiers = activeNode.soldiers - 1;
          activeNode.soldiers = 1;
          n.country.owner.countries++;
          
          plusAttack(n);
          minusAttack(n);
        }
}

void reinforceNodes(){
  for(Node n: nodes) {
    n.active = false;
    if((sqrt(((n.x - mouseX)*(n.x - mouseX)) + ((n.y - mouseY)*(n.y - mouseY))) < straal)){
      if(activeNode == null){
       Country tempC = new Country();
       tempC.name = "ya";
       activeNode = new Node();
       activeNode.country = tempC;
      }
      Country c = n.country;
      if(n.country.owner == playerTurn){
        if(!inReinforce || !Arrays.asList(n.country.neighbours).contains(activeNode.country.name)){
          for(int i = 0; i < c.neighbours.length; i++){
            Node node = getCountry(c.neighbours[i]).node;
            if(getCountry(c.neighbours[i]).owner == c.owner){
              n.active = true;
              strokeWeight(7);
              stroke(80, 126, 201);
              if((n.country.name.equals( "oranje1") && node.country.name.equals("groen3")) || (node.country.name.equals("oranje1") && n.country.name.equals("groen3"))){
                line(getCountry("oranje1").node.x, getCountry("oranje1").node.y, 33, getCountry("oranje1").node.y);
                line(getCountry("groen3").node.x, getCountry("groen3").node.y,1473,getCountry("groen3").node.y);}
              else{
              line(n.x, n.y, node.x, node.y);}
              noFill();
              ellipse(node.x, node.y, straal + 5, straal + 5);
              activeNode = n;
              inReinforce = true;
            }
          }
        }else{
          reinforceNode = n;
          cp5.remove("plusReinforce");
          cp5.remove("minusReinforce");
          cp5 = new ControlP5(this);
          strokeWeight(2);
          drawTextRefBox(n);
          cp5.addButton("plusReinforce")
             .setPosition(n.x+20, n.y-75)
             .setImages(upButton, upButton, upButton)
             .updateSize();

          cp5.addButton("minusReinforce")
             .setPosition(n.x+90, n.y-75)
             .setImages(downButton, downButton, downButton)
             .updateSize();
        }
      }
    }
  }
}

void distributeNodes(){
  for(Node n: nodes) {
    n.active = false;
    if((sqrt(((n.x - mouseX)*(n.x - mouseX)) + ((n.y - mouseY)*(n.y - mouseY))) < straal)){
      if(n.country.owner == playerTurn){
        drawGame();
        cp5.remove("plusButton");
        cp5.remove("minusButton");
        drawDistBox(n);
        drawTextDistBox(n);
        activeNode = n;
      }
    }
  }
}

void verdeelLanden() {
  int deelbaarGetal = countries.size() - (countries.size() % playerAmount);
  int verdeelAantal = deelbaarGetal / playerAmount;
  int verdeeldeLanden = 0;
  for (Country c: countries) {
    int i = (int) random(0,playerAmount);
    Player p = players.get(i);
    if((countries.size() - verdeeldeLanden) <= (countries.size() % playerAmount)){
      c.owner = p;
      p.countries++;
    }else{
    while (players.get(i).countries >= verdeelAantal) {
      i = (int) random(0,playerAmount);
      p = players.get(i);
      }
    c.owner = p;
    p.countries++;
    }
    verdeeldeLanden++;
  }
  pointSystem();
  soldaatVerdeling();
}

void drawSoldier(){
 for(Node n: nodes){
   if(n.country.owner.playerColor == color(183, 42, 42)){
     image(soldierRed,n.x + 7, n.y, 40, 40);
   }
   if(n.country.owner.playerColor == color(44, 115, 163)){
     image(soldierBlue,n.x + 7, n.y, 40, 40);
   }  
   if(n.country.owner.playerColor == color(43, 162, 47)){
     image(soldierGreen,n.x + 7, n.y, 40, 40);
   }
   if(n.country.owner.playerColor == color(219, 221, 73)){
     image(soldierYellow,n.x + 7, n.y, 40, 40);
   }
   if(n.country.owner.playerColor == color(255,165,0)){
     image(soldierOrange,n.x + 7, n.y, 40, 40);
   }
   if(n.country.owner.playerColor == color(188, 64, 182)){
     image(soldierPurple,n.x + 7, n.y, 40, 40);
   }
  
  textSize(25);
  fill(0);
  if(n.country == getCountry("blauw9")){
    text(n.soldiers, n.x - 13, n.y + 35);
  }
  else {
    text(n.soldiers, n.x + 30, n.y);
  }
 }
}

void drawSidebar() {
  int yPos = height/2-450;
  int yPosT = height/2-420;
  pointSystem();
  
  strokeWeight(3);
  for (Player p : players) {
    if (p == playerTurn) {
      strokeWeight(10);
    }
    else {
      strokeWeight(3);
    }
      fill(p.playerColor);
      stroke(0);
      rect(width-420, yPos, 400, 125, 30);
      
      fill(0);
      textAlign(CENTER);
      textSize(25);
      text(p.name, width-220, yPosT);
      
      textAlign(LEFT);
      textSize(20);
      text("Punten: ", width-400, yPosT + 30);
      text("Landen: ", width-400, yPosT + 70);
      
      textAlign(RIGHT);
      text(p.points, width-40, yPosT + 30);
      text(p.countries, width-40, yPosT + 70);
      
      fill(255);
      yPos += 140;
      yPosT += 140;
  } 

     strokeWeight(3);
     fill(91,89,87);
     rectMode(CENTER);
     rect(width-220,height-80,300,50,25);
     fill(255);
     textAlign(CENTER);
     textSize(25);
     text("Volgende beurt",width-220,height-72.5);
     
     fill(91,89,87);
     if(refAttDis.equals("distribute")){
       strokeWeight(5);
     }
     rect(width-330,height-135,100,50,25);
     strokeWeight(3);
     if(refAttDis.equals("attack")){
       strokeWeight(5);
     }
     rect(width-220,height-135,100,50,25);
     strokeWeight(3);
     if(refAttDis.equals("reinforce")){
       strokeWeight(5);
     }
     rect(width-110,height-135,100,50,25);
     strokeWeight(3);
     textAlign(CENTER);
     textSize(20);
     fill(255);
     text("Verdeel",width-330,height-127.5);
     text("Aanval",width-220,height-127.5);
     text("Versterk",width-110,height-127.5);
}

void checkContinents(Continent continent){
  List<Country> countryInContinent = new ArrayList<Country>();
  for(Country c : countries){
   if(c.continent == continent){
     countryInContinent.add(c);
   }
  }
  
  Player owner = countryInContinent.get(0).owner;
  int countryOwnerPoints = 0;
  for(Country c : countryInContinent){
    if(c.owner == owner){  
      countryOwnerPoints++;
      if(countryOwnerPoints == countryInContinent.size()){
        owner.points = owner.points + continent.points;
      }
    }
  } 
}

void pointSystem() {
  for(Player p : players){
    p.points = 0;
    p.points = p.countries;
    if(p.countries == 0){
       players.remove(p);
    }  
    if(players.size() == 1){
      state="endScreen";
      background(0);
       endScreenDraw();
    }
  }
  for(Continent c : continents) {
    checkContinents(c);
  }
}

void loadPlayers(){
  //Na dat er op de 'Volgende' knop wordt gedrukt wordt deze methode opgeroepen
  //Hierin worden de naam van de speler, zijn kleur en de rest opgeladen en opgeslaan  
  for(int i = 1; i <= playerAmount; i++){
    Player p = new Player();
    p.name = cp5.get(Textfield.class, "Naam speler " + i + ":").getText();
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
    p.countries = 0;
    p.AI = false;
    players.add(p);
  }
 
}

void soldaatVerdeling() {
  soldierAmount = 0;
  Player p = playerTurn;
  soldierAmount = p.countries*2 + (p.points - p.countries);
}

void drawSoldierBox() {
  Player p = playerTurn;
  soldierAmount = p.points/10 +  p.countries;
  rectMode(CENTER);
  fill(255,255,255);
  rect((width/2)-260,height-80,210,80);
  textAlign(CENTER);
  fill(0);
  textSize(20);
  text("Beschikbare soldaten:",(width/2)-260,height-95);
  textSize(30);
  
  int disSoldiers = 0;
  for(Node n : nodes){
   if(n.country.owner == playerTurn){
     disSoldiers += n.soldiersRenDis;
   }
  }
  
  text(soldierAmount - disSoldiers,(width/2)-260,height-60);
  fill(255);
}

void drawDistBox(Node n) {
  cp5 = new ControlP5(this);
  cp5.addButton("plusButton")
     .setPosition(n.x+20, n.y-50)
     .setImages(upButton, upButton, upButton)
     .updateSize();

  cp5.addButton("minusButton")
     .setPosition(n.x+90, n.y-50)
     .setImages(downButton, downButton, downButton)
     .updateSize();
}

void drawTextDistBox(Node n) {
  //rect
  rectMode(CORNER);
  fill(0);
  stroke(255);
  rect(n.x+17, n.y-45, 125, 40, 50);  
  //text
  textAlign(CENTER);
  textSize(30);
  fill(255);
  text(n.soldiersRenDis, n.x+80, n.y-15);
}

void drawTextRefBox(Node n) {
  //rect
  rectMode(CORNER);
  fill(0);
  stroke(255);
  rect(n.x+17, n.y-70, 125, 40, 50);  
}

void drawTutorial(){
  image(tutorial,0,0,width,height);
}

public void plusButton() {
  int disSoldiers = 0;
  for(Node n : nodes){
    disSoldiers += n.soldiersRenDis;
  }
  if(disSoldiers != soldierAmount){
  activeNode.soldiersRenDis++;
  drawTextDistBox(activeNode);
  soldierAmount--;
  }
}

public void minusButton() {
  if(activeNode.soldiersRenDis > 0 && soldierAmount > 0){
    activeNode.soldiersRenDis--;
    soldierAmount++;
  }
    drawTextDistBox(activeNode);
}

public void plusReinforce(){
  if(activeNode.soldiers > 1){
     reinforceNode.soldiers++;
     activeNode.soldiers--;
     drawGame();
  }
  strokeWeight(2);
  drawTextRefBox(reinforceNode);
}

public void minusReinforce(){
  if(reinforceNode.soldiers > 1){
     reinforceNode.soldiers--;
     activeNode.soldiers++;
     drawGame();
  }
  strokeWeight(2);
  drawTextRefBox(reinforceNode);
}

public void plusAttack(Node n){
  if(activeNode.soldiers > 1){
     n.soldiers++;
     activeNode.soldiers--;
     drawGame();
  }
  strokeWeight(2);
  drawTextRefBox(activeNode);
}

public void minusAttack(Node n){
  if(n.soldiers > 1){
     n.soldiers--;
     activeNode.soldiers++;
     drawGame();
  }
  strokeWeight(2);
  drawTextRefBox(activeNode);
}