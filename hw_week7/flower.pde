class flower {
  float r;
  float resolution=100;
  float petallen;
  float theta;
  float x;
  float y;
  float k;
  float d=3;
  float n=21;
  float c;

  float cFac;
  float ut;
 
  float xPos;
  float yPos;
  
  
  flower(float tempD) {
   
    r=tempD;
    k=n/d;
  }

  void display() {
    pushMatrix();
    translate(xPos, yPos);
    noFill();
    beginShape();
   
    for (int i=0; i<resolution*d; i++) {
      theta=map(i, 0, resolution, 0, TWO_PI);


      petallen=cos(k*theta)+c;
      x=r*petallen*cos(theta);
      y=r*petallen*sin(theta);
      point(x, y);
      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
  }

  void setPosition(float x, float y) {
  xPos=x;
  yPos=y;
  }
    void step() {
      cFac=cFac+ut;
      c=map(cFac, 0, 2, 0, 1);
      if (cFac<0.1) {
        ut=0.01;
      }

      if (cFac>2) {
        ut=-0.01;
      }
    }
  }