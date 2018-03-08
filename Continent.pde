//Dit is een class, zie het als een soort object met verschillende eigenschappen, we kunnen zoveel instanties van de class maken als we willen
//Er zullen dus meerdere continenten zijn met elk hun eigen eigenschappen. 
//Deze informatie wordt tijdens het spel opgeslagen in de RAM en moet dus niet tijdens het spel worden opgeslagen/veranderd in een bestand
//VB: class auto{
//      String modelNaam;
//      int maximumSnelheid;
//      color kleur;
//      ...

class Continent{
 //De naam
 String name;
 //Het aantal punten dat je krijgt als je dat specifiek continent veroverd
 int points;
 
}

//Deze methode kan je gebruiken als je van de naam van een continent naar een object continent will gaan
public Continent getContinent(String cName){
  for(Continent c : continents){
    if(c.name.equals(cName)){
     return c;
    }
  }
  return null;
 }