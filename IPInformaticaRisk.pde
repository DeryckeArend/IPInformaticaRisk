/**
*Ingenieursproject Informatica 1ste Bachelor 2017-2018
*Arne Callaert
*Egon Vanhoenacker
*Leonie van Renterghem
*Alex Moens
*Arend Derycke
**/

import java.util.List;

//Hier bovendaan slaan we enkele variabelen op zodat we ze later gemakkelijk terugvinden en veranderen
//Een verzameling van de landen, voorlopig starten we met 5
List<Country> countries = new ArrayList<Country>();
List<Continent> continents = new ArrayList<Continent>();

//Deze methode wordt 1 keer gelezen voor het spel wordt opgestart
void setup(){
  //fullScreen();
  size(640, 620);
  noStroke();
  background(0);
  initiate();
}

//Deze methode wordt ongeveer 10x per seconde uitgevoerd
void draw(){

}

//In deze methode kunnen we zorgen dat alles geladen wordt, de landen, continenten, spelers ...
void initiate(){
  initiateContinents();
  initiateCountries();
}

void initiateContinents(){
  Table continentTable = loadTable("Data/ContinentData.csv", "header");
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
      println("Added " + c.name + " to list, on place " + i);
    }
  }
}

void initiateCountries(){
  Table continentTable = loadTable("Data/ContinentData.csv", "header");
  TableRow row = continentTable.getRow(1);
  
  row.getString(1);
}