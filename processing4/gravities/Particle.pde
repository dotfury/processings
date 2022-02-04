class Particle {
  float x;
  float y;
  float z;
  float angle;
  
  PVector position;
  PVector velocity;
  
  int lifeTime;
  int baseLifeTime;
  
  color renderColor;
  
  Particle(float x, float y, float z, float _angle, color _renderColor) {
    position = new PVector(x, y, z);
    velocity = PVector.random3D();
    velocity.mult(random(1.1, 2));
    renderColor = _renderColor;
    baseLifeTime = int(random(10, 20));
    angle = _angle;
    lifeTime = baseLifeTime;
  }
  
  boolean dead() {
    return lifeTime <= 0;
  }
  
  void update() {
    angle += 0.01;
    lifeTime--;
  }
  
  void display() {
    int size = round(map(lifeTime, 0, baseLifeTime, 1, 10));
    
    fill(renderColor);
    
    pushMatrix();
    PVector v2 = new PVector(1, 0, 1);
    PVector perp = position.cross(v2);
    
    rotate(angle, perp.x, perp.y, perp.z);
    translate(position.x, position.y, position.z);
    box(size);
    popMatrix();
  }
}
