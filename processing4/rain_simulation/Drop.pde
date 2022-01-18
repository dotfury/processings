class Drop {
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  float dropLength;
  
  Drop() {
    position = new PVector(random(width), random(-200, height), random(-10, 20));
    velocity = new PVector(0, map(position.z, -10, 20, 4, 8), 0);
    acceleration = new PVector(0, 0, 0);
    dropLength = map(position.z, 0, 20, 10, 16);
  }
  
  void checkEdges() {
    if (position.y > height) {
      position = new PVector(random(width), random(-100, -200), random(-10, 20));
      velocity = new PVector(0, map(position.z, -10, 20, 4, 8), 0);
      acceleration = new PVector(0, 0, 0);
      dropLength = map(position.z, 0, 20, 10, 16);
    }
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    checkEdges();
    
    acceleration.mult(0);
  }
  
  void display() {
    stroke(150, 150, 255, map(position.z, 0, 20, 100, 255));
    
    pushMatrix();
    translate(position.x, position.y, position.z);
    line(position.x, position.y, position.x, position.y + dropLength);
    ellipse(position.x, position.y + dropLength, 1, 1);
    popMatrix();
  }
}
