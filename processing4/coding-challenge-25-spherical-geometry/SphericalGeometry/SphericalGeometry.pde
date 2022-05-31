import peasy.*;

PeasyCam cam;

int total = 200;

float radius = 200;

PVector[][] globe;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
  
  globe = new PVector[total + 1][total + 1];
}

void draw() {
  background(0);
  lights();
  colorMode(HSB);
  noStroke();
  
  for (int i = 0; i < total + 1; i++) {
    float latitude = map(i, 0, total, 0, PI);
    for (int j = 0; j < total + 1; j++) {
      float longitude = map(j, 0, total, 0, TWO_PI);
      float x = radius * sin(latitude) * cos(longitude);
      float y = radius * sin(latitude) * sin(longitude);
      float z = radius * cos(latitude);
      
      globe[i][j] = new PVector(x, y, z);
    }
  }
  
  for (int i = 0; i < total; i++) {
    float hu = map(i, 0, total, 0, 255 * 6);
    fill(hu % 255, 255, 255);
    
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
