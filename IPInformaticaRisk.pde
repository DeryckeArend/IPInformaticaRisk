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

//Deze methode laadt de continent data van het bestand continentdata.csv.
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
    }
  }
}

//Deze methode laadt de country data van het bestand countrydata.csv.
void initiateCountries(){
  Table countryTable = loadTable("Data/CountryData.csv", "header");
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
}