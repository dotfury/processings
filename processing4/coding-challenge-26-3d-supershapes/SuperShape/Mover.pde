class Mover {
  float x;
  float y;
  
  PVector position;
  PVector velocity;
  
  int radius;
  
  Mover(float x, float y) {
    position = new PVector(x, y);
    velocity = PVector.random2D();
    velocity.mult(random(1.5, 5));
    radius = int(random(3, 12));
  }
  
  void update() {
    position.add(velocity);
    checkEdges();
  }
  
  void checkEdges() {
    if (position.x + radius >= width) {
      position.x = width - radius;
      velocity = new PVector(velocity.x * -1, velocity.y);
    }
    if (position.x - radius <= 0) {
      position.x = radius;
      velocity = new PVector(velocity.x * -1, velocity.y);
    }
    
    if (position.y + radius >= height) {
      position.y = height - radius;
      velocity = new PVector(velocity.x, velocity.y * -1);
    }
    if (position.y - radius <= 0) {
      position.y = radius;
      velocity = new PVector(velocity.x, velocity.y * -1);
    }
  }
  
  void display() {
    pushMatrix();
    translate(position.x, position.y);
    box(4);
    popMatrix();
  }
}
