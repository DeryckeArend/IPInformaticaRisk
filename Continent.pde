//TODO:
//Placeholder names; verander als we een juiste kaart hebben gevonden
//Hierien staan alle namen van de continenten
enum continents{europa, afrika,  azie, noordAmerika, zuidAmerika, oceanie}

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
 //Het aantal landen in het continent
 int countryAmount;
 //Het aantal punten dat je krijgt als je dat specifiek continent veroverd
 int points;
 
}