ArrayList<Tree> trees;

int leafCount = 500;

float min_distance = 5;
float max_distance = 50;
float angle = 0;

PVector centerPosition;

void setup() {
  frameRate(30);
  size(600, 600, P3D);
  
  centerPosition = new PVector(width / 2, height / 2, 0);
  
  trees = new ArrayList<Tree>();
  
  for (int i = 0; i < 5; i++) {
    trees.add(new Tree());
  }
}

void draw() {
  background(30);
  
  pushMatrix();
  translate(width / 2, height / 2, 0);
  rotateX(angle);
  rotateY(angle * 1.1);
  rotateZ(angle * 1.6);
  
  for (int i = 0; i < trees.size(); i++) {
    Tree tree = trees.get(i);
    
    if (tree.dead()) {
      tree.setupTree();
    } else {
      tree.update();
      tree.display();
      tree.grow();
    }
  }
  popMatrix();
  
  angle += 0.005;
}
