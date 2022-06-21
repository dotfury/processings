class Blob {
  PVector position;
  PVector velocity;
  
  float radius;
  
  Blob(float x, float y, float z) {
    position = new PVector(x, y, z);
    velocity = PVector.random3D();
    velocity.mult(random(2, 5));
    radius = 40;
  }
  
  void checkEdges() {
    if (position.x > width || position.x < 0) {
      velocity.x *= -1;
    }
    
    if (position.y > height || position.y < 0) {
      velocity.y *= -1;
    }
    
    if (position.z > 50 || position.z < -50) {
      velocity.z *= -1;
    }
  }
  
  void update() {
    position.add(velocity);
    checkEdges();
  }
  
  void display() {
    noFill();
    stroke(0);
    strokeWeight(4);
    ellipse(position.x, position.y, radius * 2, radius * 2);
  }
}
