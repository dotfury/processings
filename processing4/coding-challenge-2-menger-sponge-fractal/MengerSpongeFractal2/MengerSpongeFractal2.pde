Box b;
Box container;

ArrayList<Box> sponge;

float count = 0;
float angle = 0;
float angle2 = 0;

boolean isIncreasing = true;

void setup() {
  frameRate(24);
  size(400, 400, P3D);

  sponge = new ArrayList<Box>();
  b = new Box(0, 0, 0, 200);
  sponge.add(b);
  
  container = new Box(0, 0, 0, 200);
}

void increaseBoxes() {  
  ArrayList<Box> next = new ArrayList<Box>();
  for (Box b : sponge) {
    ArrayList<Box> newBoxes = b.generate();
    next.addAll(newBoxes);
  }
  
  sponge = next;
}

void draw() {
  background(51);
  noStroke();
  //lights();
  
  sponge = new ArrayList<Box>();
  b = new Box(0, 0, 0, 200);
  sponge.add(b);
  
  int boxCount = round(count);
  
  for (int i = 0; i < boxCount; i++) {
    increaseBoxes();
  }
  
  pushMatrix();
  translate(width / 2, height / 2);
  rotateX(angle);
  rotateY(angle * 0.4);
  
  stroke(30);
  fill(255);
  for (Box b : sponge) { 
    b.show();
  }
  popMatrix();
  
  noFill();
  stroke(255);
  pushMatrix();
  translate(width / 2, height / 2);
  rotateX(angle2);
  rotateY(angle2 * 0.4);
  rotateZ(angle2 * 0.64);
  container.show();
  popMatrix();
  
  angle += 0.01;
  angle2 -= 0.01;
  
  if (isIncreasing) {
    count += 0.2;
  } else {
    count -= 0.2;
  }
  
  if (count >= 4) isIncreasing = false;
  if (count <= 1) isIncreasing = true;
}
