class Point {
  PVector position;
  boolean reached;
  
  Point() {
    position = PVector.random3D();
    position.mult(random(width / 2));
  }
  
  void display() {
    noStroke();
    pushMatrix();
    translate(position.x, position.y, position.z);
    ellipse(0, 0, 4, 4);
    popMatrix();
  }
}
