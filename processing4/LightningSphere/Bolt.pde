class Bolt {
  ArrayList<PVector> steps;
  
  Bolt() {
    initBolt();
  }
  
  void initBolt() {
    steps = new ArrayList<PVector>();
    
    for (int i = 0; i < 15; i++) {
      PVector vec = PVector.random3D();
      vec.mult(int(random(20, 80)));
      steps.add(vec);
    }
  }
  
  void update() {
    if (steps.size() > 0) {
      steps.remove(0);
    } else {
      initBolt();
    }
  }
  
  void display() {
    stroke(255);
    noFill();
    
    beginShape();
    for (PVector step : steps) {
      vertex(step.x, step.y, step.z);
    }
    endShape();
  }
}
