int maxZ = 70;
int scale = 20;
int space = 10;
int centerIndex = 0;
int timer;

PVector center;

ArrayList<Box> boxes;

color[] colors = new color[4];
PVector[] centers = new PVector[6];

void runApp() {
  boxes = new ArrayList<Box>();
  PVector center = centers[centerIndex % 6];
  
  for (int x = -scale; x < scale; x++) {
    for (int y = -scale; y < scale; y++) {
      float xPosition = x * space;
      float yPosition = y * space;
      float distance = dist(xPosition, yPosition, center.x, center.y);
      
      boxes.add(new Box(xPosition, yPosition, int(map(distance, 0, 300, -maxZ, maxZ))));
    }
  }
}

void setup() {
  size(450, 450);
  noFill();
  rectMode(CENTER);
  strokeWeight(1);
  frameRate(50);
  
  colors[0] = color(178, 117, 203);
  colors[1] = color(57, 135, 203);
  colors[2] = color(57, 212, 121);

  centers[0] = new PVector(0, 0);
  centers[1] = new PVector(width / 2, height / 2);
  centers[2] = new PVector(width / 3, height / 3);
  centers[3] = new PVector(width, height);
  centers[4] = new PVector(0, height);
  centers[5] = new PVector(width, 0);
  
  runApp();
}

void draw() {
  background(50);
  
  translate(width / 2 + 5, height / 2 + 5);
  
  for (Box b : boxes) {
    b.update();
    b.display();
  }
  
  if (millis() - timer >= 4000) {
    centerIndex++;
    runApp();
    timer = millis();
  }
}
