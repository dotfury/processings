class Box {
  PVector position;
  PVector velocity = new PVector(0, 0, 0.6);
  
  boolean isAdding = true;
  
  Box(float x, float y, float z) {
    position = new PVector(x, y, z);
  }
  
  void update() {
    position.add(velocity);
    
    if (isAdding && position.z >= maxZ) {
      velocity.mult(-1);
      isAdding = false;
    } else if (!isAdding && position.z <= -maxZ) {
      velocity.mult(-1);
      isAdding = true;
    }
  }
  
  void display() {
    stroke(255, map(position.z, -maxZ, maxZ, 10, 255));
    
    pushMatrix();
    translate(position.x + width / 2, position.y + height / 2, position.z);
    //rotateX(map(position.z, -maxZ, maxZ, 0, TWO_PI));
    //rotateY(map(position.z, -maxZ, maxZ, 0, TWO_PI));
    box(map(position.z, -maxZ, maxZ, 5, 7));
    popMatrix();
  }
}
