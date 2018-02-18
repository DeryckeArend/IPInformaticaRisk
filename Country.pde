//Dit is ook een class, zie Continent voor meer uitleg
class Country{
  //De naam
  String name;
  //In welk continent het land ligt
  Continent continent;
  //Dit is een verzameling (de [] zorgen daar voor), in deze verzameling slaan we de namen van de buurlanden op, zo weten we of 2 landen naast elkaar liggen
  String[] neighbours;
 
}

public Country getCountry(String cName){
  for(Country c : countries){
    if(c.name.equals(cName)){
     return c;
    }
  }
  return new Country();
 }