class Box {
  PVector position;
  float size;
  
  Box(float x, float y, float z, float _size) {
    position = new PVector(x, y, z);
    size = _size;
  }
  
  ArrayList<Box> generate() {
    ArrayList<Box> boxes = new ArrayList<Box>();
    
    for (int x = -1; x < 2; x++) {
      for (int y = -1; y < 2; y++) {
        for (int z = -1; z < 2; z++) {
          int sum = abs(x) + abs(y) + abs(z);
          float newR = size / 3;
          // inverted fractal
          if (sum <= 1) {
            Box b = new Box(position.x + x * newR, position.y + y * newR, position.z + z * newR, newR);
            boxes.add(b);
          }
          
          // menger sponge
          //if (sum > 1) {
          //  Box b = new Box(position.x + x * newR, position.y + y * newR, position.z + z * newR, newR);
          //  boxes.add(b);
          //}
        }
      }
    }
    
    return boxes;
  }
  
  void show() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    //fill(255);
    box(size);
    popMatrix();
  }
}
