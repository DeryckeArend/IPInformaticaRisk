void drawGame(){
  //We maken eerst heel het scherm schoon, door alle knoppen enzo te overschrijven
  background(0);
  //Dan laden we een afbeelding op als achtergrond. Eerst maak je in IPInformaticaRisk een variabele aan bovenaan bij de andere PImage. Dan laad je de afbeelding op in loadImages(), ook in IPInformatica
  image(riskMap, 0, 0, width, height);
  verdeelLanden();
  for(int i = 0; i < nodes.size(); i++){
    Node n = nodes.get(i);
    Country c = n.country;
    color pcolor = c.owner.playerColor;
    fill(pcolor);
    ellipse(n.x, n.y, straal, straal);
  }
  //drawSoldier();
  drawSidebar();
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
  image(soldier,n.x + 7, n.y, 50, 60);
  textSize(25);
  text(5, n.x + 30, n.y);
  }
}

void drawSidebar() {
  int yPos = 100;
  int yPosT = 130;
  int playerTurnInt = 1;
  
  strokeWeight(3);
  int i = 0;
  for (Player p : players) {
    if (i == playerTurnInt - 1) {
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
      text("Points: ", 1520, yPosT + 30);
      text("Countries: ", 1520, yPosT + 70);
      
      textAlign(RIGHT);
      text(p.points, 1880, yPosT + 30);
      text(p.countries, 1880, yPosT + 70);
      
      fill(255);
      yPos += 150;
      yPosT += 150;
      i++;
  }
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
    p.countries = 0;
    p.AI = false;
    players.add(p);
  }
 
}

void distributeSoldiers() {
  Player p = playerTurn;
  int soldierAmount = (p.points - p.countries) + p.countries/2;
  int placedSoldiers = 2;
  boolean endDistTurnButton = false;
  while(placedSoldiers < soldierAmount && !endDistTurnButton) {
    
  }
}

void drawDistBox() {
  cp5 = new ControlP5(this);
  r = cp5.addRadioButton("radioButtonPlayers")
         .setPosition(n.x,300)
         .setSize(50,50)
         .setColorForeground(color(0))
         .setColorBackground(color(89,68,39))
         .setColorActive(color(0))
         .setColorLabel(color(0))
         .setColorValue(0)
         .setItemsPerRow(5)
         .setSpacingColumn(100)
         .addItem("2",2)
         .addItem("3",3);
  PFont pfont = createFont("Arial",20,true); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont,60);
  r.setFont(font);
  //.align(ControlP5.CENTER, ControlP5.TOP);
  cp5.setFont(font);
}