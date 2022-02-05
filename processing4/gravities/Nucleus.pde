class Nucleus {  
  PVector v;
  
  Orbitor[] orbitors;
  
  Nucleus() {
    v = PVector.random3D();
  }
  
  void orbit() {    
    if (orbitors != null) {
      for (int i = 0; i < orbitors.length; i++) {
        orbitors[i].orbit();
      }
    }
  }
  
  void spawnOrbitors(int total) {
    orbitors = new Orbitor[total];
    
    for (int i = 0; i < orbitors.length; i++) {
      float s = 0;
      if (random(1, 2) > 1) {
        s = -0.08;
      } else {
        s = 0.08;
      }
      orbitors[i] = new Orbitor(100, s);
    }
  }
  
  void display() {
    stroke(255);
    noFill();
    
    box(10);
    
    if (orbitors != null) {  
      for (int i = 0; i < orbitors.length; i++) {
        orbitors[i].display();
      }
    }
  }
}
