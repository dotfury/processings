Bolt bolt;

int leafCount = 100;

float min_distance = 5;
float max_distance = 50;
float angle = 0;

PVector centerPosition;

void setup() {
  //frameRate(30);
  size(600, 600, P3D);
  
  centerPosition = new PVector(width / 2, height / 2, 0);
  
  bolt = new Bolt();
}

void draw() {
  background(30);
  
  pushMatrix();
  translate(width / 2, height / 2, 0);
  rotateX(angle);
  rotateY(angle * 1.1);
  rotateZ(angle * 1.6);
  
    
  if (bolt.dead()) {
    bolt.setupBolt();
  } else {
    bolt.update();
    bolt.display(); 
    bolt.grow();
  }
    
  popMatrix();
  
  angle += 0.005;
}
