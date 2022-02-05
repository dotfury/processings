float sceneAngle;

Nucleus nucleus;

color[] colors = new color[4];

void setup() {
  size(600, 600, P3D);
  
  sceneAngle = 0;
  
  colors[0] = color(57, 212, 203);
  colors[1] = color(57, 135, 203);
  colors[2] = color(57, 212, 121);
  colors[3] = color(178, 117, 203);

  nucleus = new Nucleus();
  nucleus.spawnOrbitors(15);
}

void draw() {
  background(30);
  
  pushMatrix();
  translate(width / 2, height / 2, 0);
  rotateX(sceneAngle);
  rotateY(sceneAngle * 1.2);
  rotateZ(sceneAngle * 0.9);
  nucleus.display();
  nucleus.orbit();
  popMatrix();
  
  sceneAngle += 0.004;
}
