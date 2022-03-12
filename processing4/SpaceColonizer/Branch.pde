class Branch {
  Branch parent;
  PVector position;
  PVector direction;
  PVector originalDirection;
  int count;
  int branchLength;
  int index;
  
  Branch(Branch _parent, PVector _pos, PVector _dir, int _index) {
    parent = _parent;
    position = _pos;
    direction = _dir;
    originalDirection = _dir.copy();
    count = 0;
    branchLength = 5;
    index = _index;
  }
  
  void reset() {
    direction = originalDirection.copy();
    count = 0;
  }
  
  void jitter() {
    position.add(new PVector(random(-0.25, 0.25), random(-0.25, 0.25), random(-0.25, 0.25)));
  }
  
  Branch next() {
    PVector nextDirection = PVector.mult(direction, branchLength);
    PVector nextPosition = PVector.add(position, nextDirection);
    
    return new Branch(this, nextPosition, direction.copy(), index + 1);
  }
  
  void display(int lifeTime) {
    if (parent != null) {
      stroke(int(map(index, 1, 50, 200, 255)), int(map(index, 1, 50, 0, 255)), int(map(index, 1, 50, 0, 255)), int(map(lifeTime, 0, 255, 0, 255)));
      line(position.x, position.y, position.z, parent.position.x, parent.position.y, parent.position.z);
    }
  }
}
