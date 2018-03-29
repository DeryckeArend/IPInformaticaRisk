int placedSoldiers;
Node activeNode;

void drawTutorial(){
  image(tutorial,0,0,width,height);
}

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
  drawSoldier();
  drawSidebar();
  
  noStroke();
  ellipse(1870, 45, 65, 65);
  image(house, 1844.5, 18, 50, 50);
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
  text(n.soldiers, n.x + 30, n.y);
 }
}

void drawSidebar() {
  int yPos = 90;
  int yPosT = 120;
  
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
      rect(1500, yPos, 400, 125, 30);
      
      fill(0);
      textAlign(CENTER);
      textSize(25);
      text(p.name, 1700, yPosT);
      
      textAlign(LEFT);
      textSize(20);
      text("Punten: ", 1520, yPosT + 30);
      text("Landen: ", 1520, yPosT + 70);
      
      textAlign(RIGHT);
      text(p.points, 1880, yPosT + 30);
      text(p.countries, 1880, yPosT + 70);
      
      fill(255);
      yPos += 140;
      yPosT += 140;
  } 

     strokeWeight(3);
     fill(91,89,87);
     rectMode(CENTER);
     rect(1700,1000,300,50,25);
     fill(255);
     textAlign(CENTER);
     textSize(25);
     text("Volgende beurt",1700,1007.5);
     
     fill(91,89,87);
     if(refAttDis.equals("distribute")){
       strokeWeight(5);
     }
     rect(1590,945,100,50,25);
     strokeWeight(3);
     if(refAttDis.equals("attack")){
       strokeWeight(5);
     }
     rect(1700,945,100,50,25);
     strokeWeight(3);
     if(refAttDis.equals("reinforce")){
       strokeWeight(5);
     }
     rect(1810,945,100,50,25);
     strokeWeight(3);
     textAlign(CENTER);
     textSize(20);
     fill(255);
     text("Verdeel",1590,952.5);
     text("Aanval",1700,952.5);
     text("Versterk",1810,952.5);
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

void distributeSoldiers() {
  activeNode.soldiersRenDis = 0;
  Player p = playerTurn;
  int soldierAmount = (p.points - p.countries) + p.countries/2;
  boolean endDistTurnButton = false;
  while(activeNode.soldiersRenDis < soldierAmount && !endDistTurnButton) {
    
  }
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

public void plusButton() {
  activeNode.soldiersRenDis++;
  drawTextDistBox(activeNode);
}

public void minusButton() {
  if(activeNode.soldiersRenDis > 0){
    activeNode.soldiersRenDis--;
  }
    drawTextDistBox(activeNode);
}