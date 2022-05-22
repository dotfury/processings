int maxZ = 50;
int scale = 21;
int space = 10;

PVector center;

ArrayList<Box> boxes;

void setup() {
  size(600, 600, P3D);
  noFill();
  
  boxes = new ArrayList<Box>();
  
  for (int x = -scale; x < scale; x++) {
    for (int y = -scale; y < scale; y++) {
      float xPosition = x * space;
      float yPosition = y * space;
      float distance = dist(xPosition, yPosition, width / 2, height / 2);
      
      boxes.add(new Box(xPosition, yPosition, map(distance, 0, 296, -maxZ, maxZ)));
    }
  }
}

void draw() {
  background(30);
  
  for (Box b : boxes) {
    b.update();
    b.display();
  }
}
