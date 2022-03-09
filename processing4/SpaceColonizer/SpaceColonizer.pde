// 10:17
Tree tree;

int leafCount = 500;

float min_distance = 5;
float max_distance = 50;

void setup() {
  size(600, 600, P3D);
   
  tree = new Tree();
}

void draw() {
  background(51);
  
  tree.display();
  tree.grow();
}
