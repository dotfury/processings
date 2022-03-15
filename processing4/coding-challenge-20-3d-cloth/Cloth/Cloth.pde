import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;
import toxi.physics3d.*;
import toxi.physics3d.behaviors.*;
import toxi.physics3d.constraints.*;
import toxi.processing.*;
// 6:20
ArrayList<Particle> particles;
ArrayList<Spring> springs;

float w = 10;

VerletPhysics2D physics;

void setup() {
  size(600, 600);
  
  particles = new ArrayList<Particle>();
  springs = new ArrayList<Spring>();
  
  physics = new VerletPhysics2D();
  
  float x = 100;
  float y = 10;
  for (int i = 0; i < 40; i++) {
    Particle p = new Particle(x, y);
    particles.add(p);
    physics.addParticle(p);
    x += w;
  }
}

void draw() {
  background(51);
  
  for (Particle p : particles) {
    p.display();
  }
}
