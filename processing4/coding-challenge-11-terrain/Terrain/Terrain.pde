int columns;
int rows;
int scale = 20;
int w = 2000;
int h = 1600;

float [][] terrain;
float flying = 0;

void setup() {
  size(600, 600, P3D);
  columns = w / scale;
  rows = h / scale;
  
  terrain = new float[columns][rows];
}

void draw() {
  flying -= 0.1;
  
  float yOff = flying;
  for (int y = 0; y < rows; y++) {
    float xOff = 0;
    for (int x = 0; x < columns; x++) {
      terrain[x][y] = map(noise(xOff, yOff), 0, 1, -100, 100);
      xOff += random(0.15, 0.2);
    }
    yOff += random(0.15, 0.2);
  }
  
  background(0);
  stroke(255);
  noFill();
  
  translate(width / 2, height / 2 + 200);
  rotateX(PI / 3);
  translate(-w / 2, -h / 2);
  
  for (int y = 0; y < rows - 1; y++){
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < columns; x++) {
      vertex(x * scale, y * scale, terrain[x][y]);
      vertex(x * scale, (y + 1) * scale, terrain[x][y + 1]);
    }
    endShape();
  }
}
