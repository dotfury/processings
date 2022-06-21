Blob[] blobs = new Blob[6];

float angle = 0;

void setup() {
  size(400, 400, P3D);
  
  for (int i = 0; i < blobs.length; i++) {
   blobs[i] = new Blob(random(width), random(height), random(-50, 50)); 
  }
}

void draw() {
  background(51);
  
  loadPixels();
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y * width;
      float sum = 0;
      for (Blob b : blobs) {
        float distance = dist(x, y, b.position.x, b.position.y);
        sum += 100 * b.radius / distance; 
      }
      
      pixels[index] = color(sum);
    }
  }
  
  updatePixels();
  
  pushMatrix();
  rotateX(angle);
  rotateY(angle * 1.1);
  
  for (Blob b : blobs) {
    b.update();
  }
  popMatrix();
  
  angle += 0.01;
}
