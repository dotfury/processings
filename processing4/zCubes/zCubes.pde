int maxZ = 80;
int scale = 21;
int space = 10;

float angle;

PVector center;

ArrayList<Box> boxes;

void setup() {
  size(600, 600, P3D);
  noFill();
  
  angle = 0;
  
  boxes = new ArrayList<Box>();
  
  for (int x = -scale; x < scale; x++) {
    for (int y = -scale; y < scale; y++) {
      float xPosition = x * space;
      float yPosition = y * space;
      float distance = dist(xPosition, yPosition, 0, 0);
      
      boxes.add(new Box(xPosition, yPosition, int(map(distance, 0, 300, -maxZ, maxZ))));
    }
  }
}

void draw() {
  background(30);
  
  translate(width / 2, height / 2, 0);
  
  rotateX(PI / 2);
  rotateZ(angle);
  
  for (Box b : boxes) {
    b.update();
    b.display();
  }
  
  angle += 0.01;
}
