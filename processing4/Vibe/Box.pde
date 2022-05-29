class Box {
  PVector position;
  PVector velocity = new PVector(0, 0, 2.5);
  
  int colorIndex = 0;
  
  boolean isAdding = true;
  
  Box(float x, float y, float z) {
    position = new PVector(x, y, z);
  }
  
  void update() {
    position.add(velocity);
    
    if (isAdding && position.z >= maxZ) {
      velocity.mult(-1);
      isAdding = false;
      colorIndex++;
    } else if (!isAdding && position.z <= -maxZ) {
      velocity.mult(-1);
      isAdding = true;
      colorIndex++;
    }
  }
  
  void display() {
    color c = colors[colorIndex % 3];
    stroke(c);
    fill(c);
    
    float size = map(position.z, -maxZ, maxZ, 1, 8);
    
    rect(position.x, position.y, size, size);
  }
}
