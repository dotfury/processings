class Box {
  PVector position;
  PVector defaultPosition;
  PVector velocity = new PVector(0, 0, 0.8);
  
  float angle = 0;
  
  Box(float x, float y, float z) {
    defaultPosition = new PVector(x, y, z);
    
    initBox();
  }
  
  void initBox() {
    position = defaultPosition.copy();
  }
  
  void update() {
    position.add(velocity);
    
    if (position.z > maxZ) {
      initBox();
    }
  }
  
  void display() {
    stroke(colors[int(map(position.z, -maxZ, maxZ, 0, 2))]);
    
    pushMatrix();
    translate(position.x, position.y, position.z);
    rotateX(angle * 1.2);
    rotateY(angle * 1.1);
    box(map(position.z, -maxZ, maxZ, 3, 10));
    popMatrix();
    
    angle += 0.01;
  }
}
