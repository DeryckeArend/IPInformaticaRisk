void game(){
  //if(mousePressed){
  //text( "x: " + mouseX + " y: " + mouseY, mouseX, mouseY );
  for(Node n: nodes) {
    if(mousePressed && (sqrt(((n.x - mouseX)*(n.x - mouseX)) + ((n.y - mouseY)*(n.y - mouseY))) < straal)){
      rect(100,100,100,100);
    }
  }
}