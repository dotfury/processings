class Particle {
  PVector position;
  PVector velocity;
  
  int lifeTime;
  
  color renderColor;
  
  Particle(PVector _position) {
    position = _position;
    velocity = PVector.random3D();
    velocity.mult(random(0.01, 0.02));
    lifeTime = 150;
    renderColor = colors[int(random(colors.length))];
  }
  
  void update() {
    position.add(velocity);
    
    lifeTime -= 1;
  }
  
  void display() {
    if (lifeTime <= 0) {
      return;
    }
    
    fill(renderColor);
    pushMatrix();
    translate(position.x, position.y, position.z);
    box(1);
    popMatrix();
  }
}
