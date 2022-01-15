class Drop {
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  float dropLength;
  
  Drop() {
    position = new PVector(random(width), random(-200, height), random(0, 20));
    velocity = new PVector(0, map(position.z, 0, 20, 4, 10), 0);
    acceleration = new PVector(0, 0, 0);
    dropLength = map(position.z, 0, 20, 10, 20);
  }
  
  void checkEdges() {
    if (position.y > height) {
      position = new PVector(random(width), random(-100, -200), random(0, 20));
      velocity = new PVector(0, map(position.z, 0, 20, 4, 10), 0);
      dropLength = map(position.z, 0, 20, 10, 20);
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
    float thick = map(position.z, 0, 20, 1, 2);
    strokeWeight(thick);
    stroke(138, 43, 226);
    
    pushMatrix();
    translate(position.x, position.y, position.z);
    line(position.x, position.y, position.x, position.y + dropLength);
    popMatrix();
  }
}
