// @author Tomas de Camino Beck
// @version 1.0 Nov 29 2015

/*
 * A wave can be represented as the superposition of many individual particles
 * oscilating with a different phase.
 */

int     gSize      =   30;  // Grid size: how tall and wide will your grid be?
int     s          =   30;  // Size: How far appart will the particles be?
float   speed      = 0.15;  // Angular velocity of every particle
float   radius     = 30.0;  // Movement radius: how much will particles move?
boolean trajectory = true;  // Draw trajectory of every particle

// Start a new square particle system
particle[][] pSystem = new particle[gSize][gSize];

void setup() {
  size(600, 600);
  for (int i = 0; i<gSize; i++) {
    for (int j = 0; j<gSize; j++) {
      pSystem[i][j] = new particle((float)i*s, (float)j*s, radius, (float)(j*i)/60, speed, trajectory);
    }
  }
  ellipseMode(CENTER);
}

void draw() {
  background(255);
  noFill();
  for (int i = 0; i<gSize; i++) {
    for (int j = 0; j<gSize; j++) {
      pSystem[i][j].updateDraw();
    }
  }
}

//particle object

class particle {
  PVector position;         // Point vector that saves (x, y, z, a)
                            // where `z` is the rotation
                            // and `a` is the index of the particle
  float   angularVelocity;  // Multiplier for rotation
  float   h;                // Hypotenuse: The radius of the movement
  boolean t;                // Draw the circle every particle follows

  particle(float x, float y, float hyp, float a, float av, boolean ty) {
    position        = new PVector(x, y, a) ;
    angularVelocity = av;
    h               = hyp;
    t               = ty;
  }

  void updateDraw() {
    // Create rotation diferentials
    position.z += angularVelocity;
    float dx    = sin(position.z)*h;
    float dy    = cos(position.z)*h;

    pushMatrix();
      translate(position.x, position.y); // Rotate

      if(t) {
        // Draw trajectory
        strokeWeight(1);
        stroke(0, 50);
        ellipse(0, 0, h*2, h*2);
      }

      // Draw particle
      stroke(0, 200);
      strokeWeight(8);
      point(dx, dy);
    popMatrix();
  }
}
