//Dit is ook een class, zie Continent voor meer uitleg
class Country{
  //De naam
  String name;
  //In welk continent het land ligt
  Continent continent;
  //Dit is een verzameling (de [] zorgen daar voor), in deze verzameling slaan we de buurlanden op, zo weten we of 2 landen naast elkaar liggen
  Country[] neighbours;
  
  Country getCountry(String name){
      Table continentTable = loadTable("Data/ContinentData.csv", "header");
      TableRow row = continentTable.getRow(0);
      row.get
      
    return c;
  }
}