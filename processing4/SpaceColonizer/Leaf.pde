class Leaf {
  PVector position;
  boolean reached;
  
  Leaf() {
    position = new PVector(random(width), random(height - 100));
  }
  
  void display() {
    circle(position.x, position.y, 5);
  }
}
