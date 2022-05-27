int maxZ = 70;
int scale = 21;
int space = 20;

PVector center;

ArrayList<Box> boxes;

color[] colors = new color[4];

void setup() {
  size(600, 600, P3D);
  noFill();
  
  colors[0] = color(178, 117, 203);
  colors[1] = color(57, 135, 203);
  colors[2] = color(57, 212, 121);
  
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
  
  translate(width / 2, height / 2);
  
  for (Box b : boxes) {
    b.update();
    b.display();
  }
}
