class Box {
  PVector position;
  PVector velocity = new PVector(0, 0, 1);
  
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
    stroke(255, map(this.position.z, -maxZ, maxZ, 30, 255));
    
    pushMatrix();
    translate(position.x + width / 2, position.y + height / 2, position.z);
    box(map(position.z, -maxZ, maxZ, 3, 7));
    popMatrix();
  }
}
