class Planet {
  float radius;
  float angle;
  float distance;
  float orbitSpeed;
  
  PVector v;
  
  color renderColor;
  
  Planet[] planets;
  
  Planet(float _radius, float _distance, float _orbitSpeed) {
    v = PVector.random3D();
    radius = _radius;
    distance = _distance;
    v.mult(distance);
    angle = random(TWO_PI);
    orbitSpeed = _orbitSpeed;
    renderColor = colors[int(random(colors.length))];
    
    noStroke();
    noFill();
  }
  
  void orbit() {
    angle += orbitSpeed;
    
    if (planets != null) {  
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }
  
  void spawnMoons(int total) {
    planets = new Planet[total];
    
    for (int i = 0; i < planets.length; i++) {
      float r = radius / 3;
      float d = radius + r + 50;
      float s = 0;
      
      if (random(1, 2) > 1) {
        s = -0.1;
      } else {
        s = 0.1;
      }
      
      planets[i] = new Planet(r, d, s);
    }
  }
  
  void display() {
    fill(renderColor);
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
