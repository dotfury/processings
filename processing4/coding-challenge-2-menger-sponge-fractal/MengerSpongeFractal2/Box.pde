class Box {
  PVector position;
  PVector startPosition;
  PVector secondaryPosition;
  float size;
  
  Box(float x, float y, float z, float _size) {
    position = new PVector(x, y, z);
    startPosition = new PVector(x, y, z);
    secondaryPosition = new PVector(x + random(-200, 200), y + random(-200, 200), z + random(-200, 200));
    size = _size;
  }
  
  ArrayList<Box> generate() {
    ArrayList<Box> boxes = new ArrayList<Box>();
    
    for (int x = -1; x < 2; x++) {
      for (int y = -1; y < 2; y++) {
        for (int z = -1; z < 2; z++) {
          int sum = abs(x) + abs(y) + abs(z);
          float newR = size / 3;
          if (isInverted) {
            // inverted fractal
            if (sum <= 1) {
              Box b = new Box(position.x + x * newR, position.y + y * newR, position.z + z * newR, newR);
              boxes.add(b);
            }
          } else {
            // menger sponge
            if (sum > 1) {
              Box b = new Box(position.x + x * newR, position.y + y * newR, position.z + z * newR, newR);
              boxes.add(b);
            }
          }
        }
      }
    }
    
    return boxes;
  }
  
  void update() {
    if (isConnected) {
      float distance = dist(position.x, position.y, position.z, startPosition.x, startPosition.y, startPosition.z);
      if (distance > 0) {
        PVector desired = PVector.sub(startPosition, position);
        desired.mult(0.1);
        position.add(desired);
      }
    } else {
      float distance = dist(position.x, position.y, position.z, secondaryPosition.x, secondaryPosition.y, secondaryPosition.z);
      if (distance > 0) {
        PVector desired = PVector.sub(secondaryPosition, position);
        desired.mult(0.1);
        position.add(desired);
      }
    }
  }
  
  void show() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    //fill(255);
    box(size);
    popMatrix();
  }
}
