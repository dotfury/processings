float angle;

Bolt bolt;

void setup() {
  size(600, 600, P3D);
  frameRate(40);
  
  angle = 0;
  bolt = new Bolt();
}

void draw() {
  background(30);
  
  pushMatrix();
  translate(width / 2, height / 2, 0);
  
  rotateX(angle);
  rotateY(angle * 1.1);
  rotateZ(angle * 1.6);
  
  bolt.update();
  bolt.display();
  popMatrix();
  
  angle += 0.005;
}
