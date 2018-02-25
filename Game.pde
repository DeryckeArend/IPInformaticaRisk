RadioButton r;

void nodeLines(){
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
}

void drawStartMenu(){
  background(0);
  image(background, 0, 0, width, height);
  cp5 = new ControlP5(this);
  cp5.setFont(ControlFont.normal(),10);
  r = cp5.addRadioButton("radioButton")
         .setPosition(20,160)
         .setSize(50,50)
         .setColorForeground(color(120))
         .setColorActive(color(255))
         .setColorLabel(color(255))
         .setItemsPerRow(5)
         .setSpacingColumn(50)
         .addItem("2",1)
         .addItem("3",2)
         .addItem("4",3)
         .addItem("5",4)
         .addItem("6",5);
         
}