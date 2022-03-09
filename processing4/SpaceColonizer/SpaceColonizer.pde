import peasy.*;

PeasyCam cam;

Tree tree;

int leafCount = 2000;

float min_distance = 5;
float max_distance = 50;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
  tree = new Tree();
}

void draw() {
  background(51);
  
  tree.display();
  tree.grow();
}
