//Dit is de setup methode van de game, de kaart nodes enzo worden hier getekend
void game(){
  //if(mousePressed){
  //text( "x: " + mouseX + " y: " + mouseY, mouseX, mouseY );
  for(Node n: nodes) {
    if(mousePressed && (sqrt(((n.x - mouseX)*(n.x - mouseX)) + ((n.y - mouseY)*(n.y - mouseY))) < straal)){
      Country c = n.country;
       for(int i = 0; i < c.neighbours.length; i++){
         Node node = getCountry(c.neighbours[i]).node;
         if(getCountry(c.neighbours[i]).owner.name.equals(c.owner.name)){
           strokeWeight(7);
           stroke(80, 126, 201);
           line(n.x, n.y, node.x, node.y);
         }
         if(!getCountry(c.neighbours[i]).owner.name.equals(c.owner.name)){
           strokeWeight(7);
           stroke(204, 79, 102);
           line(n.x, n.y, node.x, node.y);
         } 
       }
     }
  }
}

void drawGame(){
  //We maken eerst heel het scherm schoon, door alle knoppen enzo te overschrijven
  background(0);
  //Dan laden we een afbeelding op als achtergrond. Eerst maak je in IPInformaticaRisk een variabele aan bovenaan bij de andere PImage. Dan laad je de afbeelding op in loadImages(), ook in IPInformatica
  image(riskMap, 0, 0, width, height);
  //Maak een knop om terug te keren naar het hoofdmenu
  rect(10,10,200,70);
  for(int i = 0; i < nodes.size(); i++){
    Node n = nodes.get(i);
    noFill();
    ellipse(n.x, n.y, straal, straal);
  }
  drawSoldier();
}

void drawSoldier(){
 for(Node n: nodes){
  image(soldier,n.x + 7, n.y, 50, 60);
  textSize(25);
  text(5, n.x + 30, n.y);
 }
}