PVector centerPosition;
ArrayList<PVector> points;

float angle;

void setup() {
  size(600, 600, P3D);
  
  angle = 0;
  
  centerPosition = new PVector(width / 2, height / 2, 0);
  
  points = new ArrayList<PVector>();
  
  for (int i = 0; i < 10; i++) {
    PVector vec = PVector.random3D();
    vec.mult(int(random(20, 80)));
    points.add(vec);
  }
}

void draw() {
  background(30);
  fill(255);
  
  pushMatrix();
  translate(width / 2, height / 2, 0);
  rotateX(angle);
  rotateY(angle * 1.1);
  rotateZ(angle * 1.6);
  
  for (int i = 0; i < points.size(); i++) {
    PVector point = points.get(i);
    pushMatrix();
    translate(point.x, point.y, point.z);
    sphere(10);
    popMatrix();
  }
  
  popMatrix();
  
  angle += 0.005;
}
