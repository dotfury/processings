class Collision {
  PVector position;
  
  ArrayList<Particle> particles;
  
  int particleCount;
  int lifeTime;
  
  Collision (PVector _position) {
    position = _position;
    particles = new ArrayList<Particle>();
    particleCount = round(random(1, 2));
    lifeTime = round(random(20, 30));
    
    for (int i = 0; i < particleCount; i++) {
      particles.add(new Particle(position.copy(), lifeTime));
    }
  }
  
  boolean dead() {
    return lifeTime <= 0;
  }
  
  void update() {
    this.lifeTime--;
    
    for (Particle particle : particles) {
      particle.update();
    }
  }
  
  void display() {
    for (Particle particle : particles) {
      particle.display();
    }
  }
}
