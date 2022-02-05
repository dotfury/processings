class Orbitor {
  float angle;
  float distance;
  float orbitSpeed;
  
  PVector v;
  
  color renderColor;

  ArrayList<Particle> particles;
  
  Orbitor(float _distance, float _orbitSpeed) {
    v = PVector.random3D();
    distance = _distance;
    v.mult(distance);
    angle = random(TWO_PI);
    orbitSpeed = _orbitSpeed;
    renderColor = colors[int(random(colors.length))];
    particles = new ArrayList<Particle>();
  }
  
  void orbit() {
    angle += orbitSpeed;
  }
  
  void display() {    
    particles.add(new Particle(v.x, v.y, v.z, angle, renderColor));
    
    for (Particle p : particles) {
      if (!p.dead()) {
        p.update();
        p.display();
      }
    }
  }
}
