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
    // color(v1, v2, v3, alpha)
    color c = color(map(position.z, -maxZ, maxZ, 50, 100), map(position.z, -maxZ, maxZ, 20, 90), map(position.z, -maxZ, maxZ, 30, 255), map(position.z, -maxZ, maxZ, 100, 255));
    stroke(c);
    
    pushMatrix();
    translate(position.x, position.y, position.z);
    box(map(position.z, -maxZ, maxZ, 5, 7));
    popMatrix();
  }
}
