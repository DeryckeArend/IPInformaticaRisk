//Met Node bedoel ik het cirkeltje dat in elk land zal staan
class Node{
 //In welk land het cirkeltje staat
 Country country;
 //De x- en y-waarde van het middelpunt
 int x;
 int y;
 
 int getX(){
   return x;
 }
 
 int getY(){
   return y;
 }
}

public Node getNode(){
  Node n = new Node();
  return n;
}