Box b;

ArrayList<Box> sponge;

float count = 0;
float angle = 0;

boolean isIncreasing = true;
boolean isInverted = true;
boolean isConnected = true;

void setup() {
  frameRate(24);
  size(600, 600, P3D);

  sponge = new ArrayList<Box>();
  b = new Box(0, 0, 0, 300);
  sponge.add(b);
  
  for (int i = 0; i < 3; i++) {
    increaseBoxes();
  }
}

void increaseBoxes() {  
  ArrayList<Box> next = new ArrayList<Box>();
  for (Box b : sponge) {
    ArrayList<Box> newBoxes = b.generate();
    next.addAll(newBoxes);
  }
  
  sponge = next;
}

void mouseClicked() {
  isConnected = !isConnected;
}

void draw() {
  background(30);
  
  //sponge = new ArrayList<Box>();
  //b = new Box(0, 0, 0, 200);
  //sponge.add(b);
  
  //int boxCount = round(count);
  
  //for (int i = 0; i < boxCount; i++) {
  //  increaseBoxes();
  //}
  
  pushMatrix();
  translate(width / 2, height / 2);
  rotateX(angle);
  rotateY(angle * 0.4);
  rotateZ(angle * 0.64);
  
  stroke(255);
  noFill();
  for (Box b : sponge) { 
    b.update();
    b.show();
  }
  popMatrix();
  
  angle += 0.02;
  
  //if (isIncreasing) {
  //  count += 0.2;
  //} else {
  //  count -= 0.2;
  //}
  
  //if (count >= 4) isIncreasing = false;
  //if (count <= 0) isIncreasing = true;
  
  saveFrame("frame" + frameCount + ".png");
}
