float x = 0.01;
float y = 0;
float z = 0;

float sigma = 10;
float rho = 28;
float beta = 8.0 / 3.0;

float dt = 0.01;

ArrayList<PVector> points = new ArrayList<PVector>();
ArrayList<Particle> particles = new ArrayList<Particle>();

int pointLimit = 1;

float angle = 0.0;

color[] colors = new color[4];

void setup() {
  size(600, 600, P3D);
  stroke(0);
  strokeWeight(1);
  noStroke();
  
  colors[0] = color(57, 212, 203);
  colors[1] = color(57, 135, 203);
  colors[2] = color(57, 212, 121);
  colors[3] = color(178, 117, 203);
}

void draw() {
  background(30);
  
  float dx = (sigma * (y - x)) * dt;
  float dy = (x * (rho - z) - y) * dt;
  float dz = ((x * y) - (beta * z)) * dt;
  
  x = x + dx;
  y = y + dy;
  z = z + dz;
  
  points.add(new PVector(x, y, z));
  
  translate(width / 2, height / 2);
  scale(5);
  
  rotateX(angle);
  rotateY(angle * 1.6);
  rotateZ(angle * 1.2);
 
  
  int pointsLength = points.size();
   
  PVector currentPosition = points.get(pointsLength - 1);
  
  for (int i = 0; i < 3; i++) {
    particles.add(new Particle(currentPosition.copy()));
  }
  
  for (Particle p : particles) {
    p.update();
    p.display();
  }
  
  angle += 0.01;
  
  //saveFrame("frame" + frameCount + ".png");
}
