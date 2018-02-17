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
Country[] countries = new Country[8];
public Continent[] continents = new Continent[6];

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
  Continent c = new Continent();
  List<String> cNames = new ArrayList<String>();

  for(int i =0; i != continentTable.getRowCount()-1; i++){
    row = continentTable.getRow(i);
    c.name = row.getString(0);
    c.points = row.getInt(1);
    
    if(!cNames.contains(c.name)){
      cNames.add(c.name);
      continents[i] = c;
    }
  }
  println(cNames);
  println(continents[3].name);
}

void initiateCountries(){
  Table continentTable = loadTable("Data/ContinentData.csv", "header");
  TableRow row = continentTable.getRow(1);
  
  row.getString(1);
}