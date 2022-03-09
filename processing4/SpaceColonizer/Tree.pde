class Tree {
  ArrayList<Leaf> leaves;
  ArrayList<Branch> branches;
  Branch root;
  
  Tree() {
    leaves = new ArrayList<Leaf>();
    branches = new ArrayList<Branch>();
    // Parent, Position, Direction
    root = new Branch(null, new PVector(width / 2, height), new PVector(0, -1));
    
    for (int i = 0; i < leafCount; i++) {
      leaves.add(new Leaf());
    }
    
    branches.add(root);
    Branch current = root;
    boolean found = false;
    
    while (!found) {
      for (int i = 0; i < leaves.size(); i++) {
        float distance = PVector.dist(current.position, leaves.get(i).position);
        
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
  
  void grow() {
    for (int i = 0; i < leaves.size(); i++) {
      Leaf leaf = leaves.get(i);
      Branch closestBranch = null;
      float record = Float.POSITIVE_INFINITY;
      
      for (int j = 0; j < branches.size(); j++) {
        Branch branch = branches.get(j);
        float distance = PVector.dist(leaf.position, branch.position);
        
        if (distance < min_distance) {
          leaf.reached = true;
          closestBranch = null;
          break;
        } else if (closestBranch == null || distance < record) {
          closestBranch = branch;
          record = distance;
        }
      }
      
      if (closestBranch != null) {
        PVector newDirection = PVector.sub(leaf.position, closestBranch.position);
        newDirection.normalize();
        
        closestBranch.direction.add(newDirection);
        closestBranch.count++;
      }
    }
    
    for (int i = branches.size() - 1; i >= 0; i--) {
      Branch branch = branches.get(i);
      
      if (branch.count > 0) {
        branch.direction.div(branch.count + 1);
        branches.add(branch.next());
      }
      
      branch.reset();
    }
  }
  
  void display() {
    for (Branch branch : branches) {
      branch.display();
    }
    
    for (Leaf leaf : leaves) {
      if (!leaf.reached) { 
        leaf.display();
      }
    }
  }
}
