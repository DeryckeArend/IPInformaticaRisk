void neighbourNodes(){
  for(Node n: nodes) {
    if(mousePressed && (sqrt(((n.x - mouseX)*(n.x - mouseX)) + ((n.y - mouseY)*(n.y - mouseY))) < straal)){
      drawGame();
      Country c = n.country;
       for(int i = 0; i < c.neighbours.length; i++){
         Node node = getCountry(c.neighbours[i]).node;
         
         if(getCountry(c.neighbours[i]).owner.name.equals(c.owner.name)){
           text("test", 100,100);
           fill(80, 126, 201);
           ellipse(node.x, node.y, straal, straal);
         }
         if(!getCountry(c.neighbours[i]).owner.name.equals(c.owner.name)){
           text("test", 100,100);
           fill(204, 79, 102);
           ellipse(node.x, node.y, straal, straal);
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
  for(int i = 0; i < nodes.size(); i++){
    Node n = nodes.get(i);
    fill(0);
    ellipse(n.x, n.y, straal, straal);
  }
}