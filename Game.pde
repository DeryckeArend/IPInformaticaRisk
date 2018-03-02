RadioButton r;
RadioButton r2;
Button b;

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
  text("Selecteer de Spel-Instellingen",960,75);
  text("Aantal spelers:", 960, 250);
  text("Aantal computer-spelers:", 960, 500);
  r = cp5.addRadioButton("radioButton")
         .setPosition(590,300)
         .setSize(60,60)
         .setColorForeground(color(0))
         .setColorActive(color(0))
         .setColorLabel(color(0))
         .setItemsPerRow(5)
         .setSpacingColumn(100)
         .addItem("2",1)
         .addItem("3",2)
         .addItem("4",3)
         .addItem("5",4)
         .addItem("6",5);
         
  r2 = cp5.addRadioButton("radioButton2")
         .setPosition(590,550)
         .setSize(60,60)
         .setColorForeground(color(0))
         .setColorActive(color(0))
         .setColorLabel(color(0))
         .setItemsPerRow(5)
         .setSpacingColumn(100)
         .addItem("1 ",6)
         .addItem("2 ",7)
         .addItem("3 ",8)
         .addItem("4 ",9)
         .addItem("5 ",10);
         
  PFont pfont = createFont("Arial",20,true); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont,60);
  r.setFont(font);
  //.align(ControlP5.CENTER, ControlP5.TOP);
  cp5.setFont(font);
  
  fill(30,120,69);
  rect((width/2 -100),800, 200,75);
  
}