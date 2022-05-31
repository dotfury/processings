import peasy.*;

PeasyCam cam;

int total = 20;

float radius = 200;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
}

void draw() {
  background(0);
  fill(255);
  lights();
  
  for (int i = 0; i < total; i++) {
    float longitude = map(i, 0, total, -PI, PI);
    for (int j = 0; j < total; j++) {
      float latitude = map(j, 0, total, -HALF_PI, HALF_PI);
      float x = radius * sin(longitude) * cos(latitude);
      float y = radius * sin(longitude) * sin(latitude);
      float z = radius * cos(longitude);
      
      stroke(255);
      strokeWeight(4);
      point(x, y, z);
    }
  }
}
