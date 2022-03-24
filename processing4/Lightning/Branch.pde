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
    branchLength = 15;
    index = _index;
  }
  
  void reset() {
    direction = originalDirection.copy();
    count = 0;
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
