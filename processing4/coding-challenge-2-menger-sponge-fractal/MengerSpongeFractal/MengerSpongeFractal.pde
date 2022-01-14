float angle = 0;
Box b;
ArrayList<Box> sponge;

void setup() {
  size(400, 400, P3D);
  sponge = new ArrayList<Box>();
  b = new Box(0, 0, 0, 200);
  sponge.add(b);
}

void mousePressed() {
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
  noFill();
  lights();
  
  translate(width / 2, height / 2);
  rotateX(angle);
  rotateY(angle * 0.4);
  for (Box b : sponge) { 
    b.show();
  }
  angle += 0.01;
}
