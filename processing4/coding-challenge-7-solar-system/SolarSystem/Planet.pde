class Planet {
  float radius;
  float angle;
  float distance;
  float orbitSpeed;
  
  PVector v;
  
  Planet[] planets;
  
  Planet(float _radius, float _distance, float _orbitSpeed) {
    v = PVector.random3D();
    radius = _radius;
    distance = _distance;
    v.mult(distance);
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
      float r = radius / (level * 2);
      float d = random(radius + r, (radius + r) * 2);
      planets[i] = new Planet(r, d, random(-0.1, 0.1));
      if (level < 2) {
        int count = int(random(0, 3));
        planets[i].spawnMoons(count, level + 1);
      }
    }
  }
  
  void display() {
    fill(255);
    noStroke();
    
    pushMatrix();
    PVector v2 = new PVector(1, 0, 1);
    PVector perp = v.cross(v2);
    rotate(angle, perp.x, perp.y, perp.z);
    
    // cross product vectors
    //stroke(255, 0, 0);
    //line(0, 0, 0, v.x, v.y, v.z);
    //stroke(0, 0, 255);
    //line(0, 0, 0, perp.x, perp.y, perp.z);
    //noStroke();
    
    translate(v.x, v.y, v.z);
    sphere(radius);
    
    if (planets != null) {  
      for (int i = 0; i < planets.length; i++) {
        planets[i].display();
      }
    }
    popMatrix();
  }
}
