float x = 0.01;
float y = 0;
float z = 0;

float sigma = 10;
float rho = 28;
float beta = 8.0 / 3.0;

float dt = 0.01;

ArrayList<PVector> points = new ArrayList<PVector>();

int pointLimit = 100;

float angle = 0.0;

void setup() {
  size(600, 600, P3D);
  colorMode(HSB);
  stroke(255);
  strokeWeight(1);
  noFill();
}

void draw() {
  background(0);
  
  float dx = (sigma * (y - x)) * dt;
  float dy = (x * (rho - z) - y) * dt;
  float dz = ((x * y) - (beta * z)) * dt;
  
  x = x + dx;
  y = y + dy;
  z = z + dz;
  
  points.add(new PVector(x, y, z));
  
  translate(width / 2, height / 2);
  scale(map(sin(angle), -1, 1, 2, 5));
  
  rotateX(angle);
  rotateY(angle * 1.6);
  rotateZ(angle * 1.2);
 
  beginShape();
  float hu = 0;
  
  int pointsLength = points.size();
  
  if (pointsLength > pointLimit) {
    int j = 0;
    for (int i = pointsLength - 1; j < pointLimit; i--) {
      stroke(hu, map(sin(angle), -1, 1, 50, 100), 255);
      vertex(points.get(i).x, points.get(i).y, points.get(i).z);
      j += 1;
      
      hu += random(0.1, 2);
      if (hu > 360) {
        hu = 0;
      }
    }
  }
  
  endShape();
  
  angle += 0.01;
}
