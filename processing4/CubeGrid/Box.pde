class Box {
  PVector position;
  PVector defaultPosition;
  PVector velocity = new PVector(0, 0, 1);
  
  float angle;
  
  Box(float x, float y, float z) {
    defaultPosition = new PVector(x, y, z);
    
    initBox();
  }
  
  void initBox() {
    position = defaultPosition.copy();
    angle = 0;
  }
  
  void update() {
    position.add(velocity);
    
    if (position.z > maxZ) {
      initBox();
    }
  }
  
  void display() {
    // color(v1, v2, v3, alpha)
    //color c = color(map(position.z, -maxZ, maxZ, 50, 100), map(position.z, -maxZ, maxZ, 20, 90), map(position.z, -maxZ, maxZ, 30, 255), map(position.z, -maxZ, maxZ, 100, 255));
    stroke(255, map(position.z, -maxZ, maxZ, 10, 100));
    
    pushMatrix();
    translate(position.x, position.y, position.z);
    rotateZ(angle);
    box(map(position.z, -maxZ, maxZ, 3, 10));
    popMatrix();
    
    angle += 0.001;
  }
}
