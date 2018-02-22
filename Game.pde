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