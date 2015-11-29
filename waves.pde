// @author Tomas de Camino Beck
// @version 1.0 Nov 29 2015

int gSize=30;
int s=30;
float speed = 0.15;
particle[][] pSystem = new particle[gSize][gSize];

void setup() {
  size(600, 600); 
  for (int i = 0; i<gSize; i++) {
    for (int j = 0; j<gSize; j++) {    
      pSystem[i][j] = new particle((float)i*s, (float)j*s, 30.0, (float)(j*i)/60, speed);
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
  PVector position; 
  float angularVelocity;
  float h;

  particle(float x, float y, float hyp, float a, float av) {
    position = new PVector(x, y, a) ;
    angularVelocity=av;
    h=hyp;
  }

  void updateDraw() {
    position.z+=angularVelocity;
    float dx=sin(position.z)*h;
    float dy=cos(position.z)*h;
    pushMatrix();
    translate(position.x, position.y);
    strokeWeight(1);
    stroke(0, 50);
    ellipse(0, 0, h*2, h*2);
    stroke(0, 200);
    strokeWeight(8);
    point(dx, dy);
    popMatrix();
  }
}
