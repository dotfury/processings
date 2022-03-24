class Bolt {
  ArrayList<Point> points;
  ArrayList<Branch> branches;
  Branch root;
  int lifeTime;
  
  Bolt() {
    setupBolt();
  }
  
  void setupBolt() {
    points = new ArrayList<Point>();
    branches = new ArrayList<Branch>();
    lifeTime = int(random(100, 200));
    // Parent, Position, Direction
    root = new Branch(null, new PVector(random(-2, 2), random(-2, 2), 10), new PVector(0, random(-1, 1)), 1);
    
    for (int i = 0; i < leafCount; i++) {
      points.add(new Point());
    }
    
    branches.add(root);
    Branch current = root;
    boolean found = false;
    
    while (!found) {
      for (int i = 0; i < points.size(); i++) {
        float distance = PVector.dist(current.position, points.get(i).position);
        
        if (distance < max_distance) {
          found = true;
        }
      }
      
      if (!found) {
        current = current.next();
        branches.add(current);
      }
    }
  }
  
  void update() {
    lifeTime--;
  }
  
  boolean dead() {
    return lifeTime <= 0;
  }
  
  void grow() {
    for (int i = 0; i < points.size(); i++) {
      Point point = points.get(i);
      Branch closestBranch = null;
      float record = Float.POSITIVE_INFINITY;
      
      for (int j = 0; j < branches.size(); j++) {
        Branch branch = branches.get(j);
        float distance = PVector.dist(point.position, branch.position);
        
        if (distance < min_distance) {
          point.reached = true;
          closestBranch = null;
          break;
        } else if (closestBranch == null || distance < record) {
          closestBranch = branch;
          record = distance;
        }
      }
      
      if (closestBranch != null) {
        PVector newDirection = PVector.sub(point.position, closestBranch.position);
        newDirection.normalize();
        
        closestBranch.direction.add(newDirection);
        closestBranch.count++;
      }
    }
    
    for (int i = branches.size() - 1; i >= 0; i--) {
      Branch branch = branches.get(i);
      
      if (branch.count > 0) {
        branch.direction.div(branch.count);
        PVector random = PVector.random2D();
        random.setMag(0.3);
        branch.direction.add(random);
        branch.direction.normalize();
        branches.add(branch.next());
        branch.reset();
      }
    }
  }
  
  void display() {
    for (int i = 0; i < branches.size(); i++) {
      Branch branch = branches.get(i);
      
      if (branch.parent != null) {
        float sw = map(i, 0, branches.size(), 4, 0);
        strokeWeight(sw);
        stroke(255);
        branch.display(lifeTime);
      }
    }
    
    branches.add(root.next());
  }
}
