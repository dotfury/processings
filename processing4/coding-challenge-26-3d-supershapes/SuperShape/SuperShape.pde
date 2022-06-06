import peasy.*;

PeasyCam cam;
// 14:54
int total = 75;

float radius = 200;
float a = 1;
float b = 1;

PVector[][] globe;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
  
  globe = new PVector[total + 1][total + 1];
  
  stroke(255);
  noFill();
}

float superShape(float theta, float m, float n1, float n2, float n3) {  
  float t1 = abs((1 / a) * cos(m * theta / 4));
  t1 = pow(t1, n2);
  
  float t2 = abs((1 / b) * sin(m * theta / 4));
  t2 = pow(t2, n3);
  
  float t3 = t1 + t2;
  
  float radius = pow(t3, -1 / n1);
  
  return radius;
}

void draw() {
  background(0);
  lights();
  //colorMode(HSB);
  
  for (int i = 0; i < total + 1; i++) {
    float latitude = map(i, 0, total, -HALF_PI, HALF_PI);
    float r2 = superShape(latitude, 7, 0.2, 1.7, 1.7);
    for (int j = 0; j < total + 1; j++) {
      float longitude = map(j, 0, total, -PI, PI);
      float r1 = superShape(longitude, 7, 0.2, 1.7, 1.7);
      float x = radius * r1 * cos(longitude) * r2 * cos(latitude);
      float y = radius * r1 * sin(longitude) * r2 *cos(latitude);
      float z = radius * r2 * sin(latitude);
      
      globe[i][j] = new PVector(x, y, z);
    }
  }
  
  for (int i = 0; i < total; i++) {
    //float hu = map(i, 0, total, 0, 255 * 6);
    //fill(hu % 255, 255, 255);
    
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < total + 1; j++) {      
      PVector v1 = globe[i][j];
      vertex(v1.x, v1.y, v1.z);
      
      PVector v2 = globe[i + 1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
}
