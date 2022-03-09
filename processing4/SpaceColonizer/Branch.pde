class Branch {
  Branch parent;
  PVector position;
  PVector direction;
  PVector originalDirection;
  int count;
  int branchLength;
  
  Branch(Branch _parent, PVector _pos, PVector _dir) {
    parent = _parent;
    position = _pos;
    direction = _dir;
    originalDirection = _dir.copy();
    count = 0;
    branchLength = 5;
  }
  
  void reset() {
    direction = originalDirection.copy();
    count = 0;
  }
  
  Branch next() {
    PVector nextDirection = PVector.mult(direction, branchLength);
    PVector nextPosition = PVector.add(position, nextDirection);
    
    return new Branch(this, nextPosition, direction.copy());
  }
  
  void display() {
    if (parent != null) {
      line(position.x, position.y, position.z, parent.position.x, parent.position.y, parent.position.z);
    }
  }
}
