import peasy.*;

Planet sun;

PeasyCam cam;

color[] colors = new color[4];

void setup() {
  size(600, 600, P3D);
  
  colors[0] = color(57, 212, 203);
  colors[1] = color(57, 135, 203);
  colors[2] = color(57, 212, 121);
  colors[3] = color(178, 117, 203);

  cam = new PeasyCam(this, 500);
  sun = new Planet(50, 0, 0);
  sun.spawnMoons(20);
}

void draw() {
  background(30);
  
  lights();
  pointLight(255, 255, 255, 0, 0, 0);
  
  sun.display();
  sun.orbit();
}
