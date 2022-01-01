final int xOff = 100;
final int yOff = 100;
final int spacing = 12;
final float rez = 0.0005;

class GridAngle {
  int x, y, r;
  float angle;
  PVector v;
  
  GridAngle(int _x, int _y, int _r, float _angle) {
    x = _x;
    y = _y;
    r = _r;
    angle = _angle;
    
    v = new PVector(x + r * cos(angle), y + r * sin(angle));
  }
  
  void display() {
   strokeWeight(1);
   //stroke(255);
   line(x, y, v.x, v.y);
  }
}
 
ArrayList createGrid() {
  ArrayList<ArrayList<GridAngle>> grid = new ArrayList<ArrayList<GridAngle>>();
 for (int x = -xOff; x < width + xOff; x += spacing) {
   ArrayList<GridAngle> row = new ArrayList<GridAngle>();
   
   for (int y = -yOff; y < width + yOff; y += spacing) {
     float angle = map(noise(x * rez, y * rez), 0.0, 1.0, 0.0, TAU);
     
     row.add(new GridAngle(x, y, spacing / 2, angle));
   }
   
   grid.add(row);
 }
 
 return grid;
}
 
 void setup() {
   size(600, 600);
   noFill();
 }
 
 void draw() {
  background(255);
  ArrayList<ArrayList<GridAngle>> grid = createGrid();
   
   for (int x = 0; x < grid.size(); x++) {
     for (int y = 0; y < grid.get(0).size(); y++) {
       grid.get(x).get(y).display();
     }
   }
}
