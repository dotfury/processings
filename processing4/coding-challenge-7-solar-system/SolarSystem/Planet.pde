class Planet {
  float radius;
  float angle;
  float distance;
  float orbitSpeed;
  
  Planet[] planets;
  
  Planet(float _radius, float _distance, float _orbitSpeed) {
    radius = _radius;
    distance = _distance;
    angle = random(TWO_PI);
    orbitSpeed = _orbitSpeed;
  }
  
  void orbit() {
    angle += orbitSpeed;
    
    if (planets != null) {  
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }
  
  void spawnMoons(int total, int level) {
    planets = new Planet[total];
    
    for (int i = 0; i < planets.length; i++) {
      float r = radius / (level * 1.2);
      float d = random(75, 300);
      planets[i] = new Planet(r, d / level, random(-0.01, 0.01));
      if (level < 3) {
        int count = int(random(0, 4));
        planets[i].spawnMoons(count, level + 1);
      }
    }
  }
  
  void display() {
    fill(255, 100);
    
    pushMatrix();
    rotate(angle);
    translate(distance, 0);
    ellipse(0, 0, radius * 2, radius * 2);
    
    if (planets != null) {  
      for (int i = 0; i < planets.length; i++) {
        planets[i].display();
      }
    }
    popMatrix();
  }
}
