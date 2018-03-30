/**
*Ingenieursproject Informatica 1ste Bachelor 2017-2018
*Arne Callaert
*Egon Vanhoenacker
*Leonie van Renterghem
*Alex Moens
*Arend Derycke
**/

import java.util.List;
import controlP5.*;
import java.util.Collections;
import java.util.Arrays;

//Hier bovenaan slaan we enkele variabelen op zodat we ze later gemakkelijk terugvinden en veranderen
List<Country> countries = new ArrayList<Country>();
List<Continent> continents = new ArrayList<Continent>();
List<Node> nodes = new ArrayList<Node>();
List<Player> players = new ArrayList<Player>();
ControlP5 cp5;

//De variabelen die het aantal spelers bijhouden
int playerAmount;
int AIAmount = 0;

//Hierin slaan we de status op van het huidige scherm dat de game moet tonen. Oftewel "menu", "optionsMenu", "instructionsMenu", "creditMenu", "startMenu", "gameAttack", "gamereinforce" . We beginnen met menu
String state = "loadScreen";
//Welke speler aan de beurt is
Player playerTurn;
int playerTurnInt = 0;
//De hoeveelste beurt het is, met 1 beurt bedoel ik hier dat iedereen 1 keer aan de beurt is geweest
int globalTurn = 0;
//Hierin staat wat de speler aan het doen is, "distribute", "attack" of "reinforce", gebruik aub precies deze namen
String refAttDis = "distribute";

//Hier staan alle afbeeldingen zodat we ze van overal in het spel kunnen opladen, voor dat je een afbeelding kan tonen moet je hier een variabele PImage zetten met de naam die je wilt gebruiken
PImage background;
PImage logo;
PImage riskMap;
PImage soldierRed;
PImage soldierBlue;
PImage soldierPurple;
PImage soldierYellow;
PImage soldierOrange;
PImage soldierGreen;
PImage house;
PImage upButton;
PImage downButton;
PImage redCross;
PImage tutorial;
PImage musicOn;

//Deze methode wordt 1 keer gelezen voor het spel wordt opgestart
void setup(){
  fullScreen();
  loadScreen();
  surface.setResizable(true);
  state="menu";
  initiate();
  drawMainMenu();
  setupSound();
  //drawDice(4,5);
}

//Deze methode wordt ongeveer 10x per seconde uitgevoerd
void draw(){
 switch(state){
    case("loadScreen"):
     loadScreen();  
    break;
    case("menu"):

    break;
    case("optionsMenu"):
      updateSlider();
    break;
    case("instructionsMenu"):

    break;
    case("creditMenu"):
      drawCreditsMenu();
    break;
    case("gameAttack"):

    break;
    case("gamereinforce"):

    break;
    case("startMenu"):

    break;
    case("game"):
      if(soundActive){
        drawSliderBox();
        updateSlider();
      }
    break;
  }
}

//In deze methode kunnen we zorgen dat alles geladen wordt, de landen, continenten, spelers ...
void initiate(){
  initiateContinents();
  initiateCountries();
  loadImages();
  drawMainMenu();
}

//Alle afbeeldingen die gebruikt worden, moeten hier geladen worden voor het spel start. Let erop dat je geen .png of .jpg vergeet
void loadImages(){
  background = loadImage("data/Images/mainMenuPlaceholder.jpg");
  logo = loadImage("data/Images/logoDMCV.png");
  riskMap = loadImage("data/Images/mapLaatsteVersieAangepast.png");
  soldierRed = loadImage("data/Images/soldierRed.png");
  soldierBlue = loadImage("data/Images/soldierBlue.png");
  soldierOrange = loadImage("data/Images/soldierOrange.png");
  soldierYellow = loadImage("data/Images/soldierYellow.png");
  soldierGreen = loadImage("data/Images/soldierGreen.png");
  soldierPurple = loadImage("data/Images/soldierPurple.png");
  house = loadImage("data/Images/house.png");
  upButton = loadImage("data/Images/up.png");
  downButton = loadImage("data/Images/down.png");
  redCross = loadImage("data/Images/redCross2.png");
  tutorial = loadImage("data/Images/tutorial.png");
  musicOn = loadImage("data/Images/musicon.png");
}

//Deze methode laadt de continent data van het bestand continentdata.csv.
//De continenten worden opgeslagen in de arraylist continents
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
        n.soldiers = 0;
        n.active = false;
        nodes.add(n);
        c.node = n;
      }
    }
  }
}