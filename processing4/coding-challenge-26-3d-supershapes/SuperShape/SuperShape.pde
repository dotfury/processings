int total = 75;

float m = 0;
float radius = 200;
float a = 1;
float b = 1;
float offset = 0;
float angle = 0;
float n1 = 1;
float n2 = 1;
float n3 = 1;

PVector[][] globe;

color[] colors = new color[3];

Mover[] movers = new Mover[6];

void setup() {
  size(600, 600, P3D);
  
  globe = new PVector[total + 1][total + 1];
  
  colors[0] = color(178, 117, 203);
  colors[1] = color(57, 135, 203);
  colors[2] = color(57, 212, 121);
  
  for (int i = 0; i < 6; i++) {
    movers[i] = new Mover(random(width), random(height));
  }
  
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
  m = map(movers[0].position.x, 0, width, 0, 17);
  n1 = map(movers[0].position.y, 0, height, 0.02, 60);
  n2 = map(movers[1].position.x, 0, width, 0.2, 5.5);
  n3 = map(movers[1].position.y, 0, height, 0.3, 3);
  a = map(movers[2].position.x, 0, width, 0, 5);
  b = map(movers[2].position.y, 0, height, 0, 3);
  
  background(40);
  lights();
  
  pushMatrix();
  translate(width / 2, height / 2, -100);
  rotateX(angle);
  rotateY(angle * 1.1);
  rotateZ(angle * 1.3);
  for (int i = 0; i < total + 1; i++) {
    float latitude = map(i, 0, total, -HALF_PI, HALF_PI);
    float r2 = superShape(latitude, m, n1, n2, n3);
    for (int j = 0; j < total + 1; j++) {
      float longitude = map(j, 0, total, -PI, PI);
      float r1 = superShape(longitude, m, n1 * 6, n2 * 10, n3 * 3);
      float x = radius * r1 * cos(longitude) * r2 * cos(latitude);
      float y = radius * r1 * sin(longitude) * r2 *cos(latitude);
      float z = radius * r2 * sin(latitude);
      
      globe[i][j] = new PVector(x, y, z);
    }
  }
  
  offset += 0.04;
  for (int i = 0; i < total; i++) {
    //float hu = map(i, 0, total, 0, 2);
    //color c = colors[int((hu + offset) % 3)];

    stroke(255);
    
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < total + 1; j++) {      
      PVector v1 = globe[i][j];
      vertex(v1.x, v1.y, v1.z);
      
      PVector v2 = globe[i + 1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
  
  popMatrix();
  
  angle += 0.003;
  
  for (Mover mover : movers) {
    mover.update();
    mover.display();
  }
}
