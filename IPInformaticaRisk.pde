/**
*Ingenieursproject Informatica 1ste Bachelor 2017-2018
*Arne Callaert
*Egon Vanhoenacker
*Leonie van Renterghem
*Alex Moens
*Arend Derycke
**/

import java.util.List;

//Hier bovenaan slaan we enkele variabelen op zodat we ze later gemakkelijk terugvinden en veranderen
List<Country> countries = new ArrayList<Country>();
List<Continent> continents = new ArrayList<Continent>();
List<Node> nodes = new ArrayList<Node>();

//Hierin slaan we de status op van het huidige scherm dat de game moet tonen. Oftewel "menu", "optionsMenu", "instructionsMenu", "creditMenu" of "game" . We beginnen met menu
String state = "menu";

//Hier staan alle afbeeldingen zodat we ze van overal in het spel kunnen opladen, voor dat je een afbeelding kan tonen moet je hier een variabele PImage zetten met de naam die je wilt gebruiken
PImage background;
PImage logo;
PImage riskMap;

//Deze methode wordt 1 keer gelezen voor het spel wordt opgestart
void setup(){
  fullScreen();
  //size(640, 620);
  noStroke();
  background(0);
  initiate();
  mainMenuSetup();
  setupDice();
  //setupSound();
}

//Deze methode wordt ongeveer 10x per seconde uitgevoerd
void draw(){
  switch(state){
    case("menu"):
      mainMenu();
    break;
    case("optionsMenu"):
      returnMenu();
    break;
    case("instructionsMenu"):
    
    break;
    case("creditMenu"):
    break;
    
    case("game"):
      //game();
    game(); 
    break;
    default:
      println("EMERGENCY: THERE'S SOMETHING WRONG WITH THE GAME STATE! CAN'T START GAME");
    break;
  }
}

//In deze methode kunnen we zorgen dat alles geladen wordt, de landen, continenten, spelers ...
void initiate(){
  initiateContinents();
  initiateCountries();
  loadImages();
}

//Alle afbeeldingen die gebruikt worden, moeten hier geladen worden voor het spel start. Let erop dat je geen .png of .jpg vergeet
void loadImages(){
  background = loadImage("data/Images/mainMenuPlaceholder.jpg");
  logo = loadImage("data/Images/logoDMCV.png");
  riskMap = loadImage("data/Images/riskMap.jpg");
}

//Deze methode laadt de continent data van het bestand continentdata.csv.
void initiateContinents(){
  Table continentTable = loadTable("data/ContinentData.csv", "header");
  TableRow row;
  List<String> cNames = new ArrayList<String>();

  for(int i =0; i < continentTable.getRowCount(); i++){
    row = continentTable.getRow(i);
    Continent c = new Continent();
    c.name = row.getString(0);
    c.points = row.getInt(1);
    
    if(!cNames.contains(c.name)){
      cNames.add(c.name);
      continents.add(c);
    }
  }
}

//Deze methode laadt de country data van het bestand countrydata.csv.
void initiateCountries(){
  Table countryTable = loadTable("data/CountryData.csv", "header");
  TableRow row;
  
  //Hierin laden we de naam en het continent van het land.
  for(int i =0; i < countryTable.getRowCount(); i++){
    row = countryTable.getRow(i);
    Country c = new Country();
    c.name = row.getString(0);
    c.continent = getContinent(row.getString(1));
    c.neighbours = row.getString(4).split(",");
    countries.add(c);
  }
  
  //Hierin laden we de x- en y-coordinaten van de node en verbinden we de node met het land
  for(int i =0; i < countryTable.getRowCount(); i++){
    row = countryTable.getRow(i);
    for(Country c : countries){
      if(c.name.equals(row.getString(0))){
        Node n = new Node();
        n.x = row.getInt(2);
        n.y = row.getInt(3);
        n.country = c;
        nodes.add(n);
        c.node = n;
      }
    }
  }
}