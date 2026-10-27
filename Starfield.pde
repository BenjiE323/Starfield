class particle
{
  double myX,myY,myAngle;
  int mySpeed;
  
  particle() {
    myAngle = (Math.random() * Math.PI * 2);
    mySpeed = (int)(Math.random() * 3 + 1);
    myX = 500;
    myY = 500;
  } // end constructer
  
  void boom() {
     myX += cos ((float)(myAngle)) * mySpeed ;
    myY += sin ((float)(myAngle)) * mySpeed ;
  } // end boom
  
  void show()
  {
  fill(255,255,255);
  ellipse((float)myX, (float)myY, 5,5);
  } // end show
}// end of class

class Stars extends particle {
  Stars() {
    myX = 500;
    myY = 500;
    myAngle = (Math.random() * Math.PI * 2);
    mySpeed = (int)(Math.random() * 3 + 1);       
  }
  
 void boom() {
   myX += cos ((float)(myAngle)) * mySpeed;
    myY += sin ((float)(myAngle)) * mySpeed;
 }
 
 void show() {
   noStroke();
   strokeWeight(3);
   stroke(255,0,0);
   stroke(230,230,250);
   line((float)myX, (float)myY, (float)myX +(cos ((float)(myAngle)) * mySpeed) * 50, (float)myY - (sin ((float)(myAngle)) * mySpeed) * 50); 
   stroke(255);
 }
}//end stars class

class STAR2 extends particle {
  STAR2 () {
    myX = 500;
    myY = 500;
    myAngle = (Math.random() * Math.PI * 2);
    mySpeed = (int)(Math.random() * 2 + 1); 
  }
  
  void boom() {
    myX += cos ((float)(myAngle)) * mySpeed;
    myY += sin ((float)(myAngle)) * mySpeed;
  }
  
  void show() {
    fill(255,255,255);
//    line((float)myX, (float)myY, (float)myX + 6, (float)myY + 6);
ellipse((float)myX, (float)myY, 3,3);
  }
}//end star2 class


class ship
{
  int myX, myY, myLength, myWidth, mySpeed;
  ship() {
  myX = -30;
  myY = (int)(Math.random()*900 +50);
  myLength = 20;
  myWidth = 10;
  mySpeed = (int)(Math.random() * 5 + 5);
  }
void fly() {
  myX += mySpeed;
}
void show() {
  fill(250,129,42);
  ellipse(myX, myY, myLength, myWidth);
}
}//end ship class

class asteriod extends ship {
  asteriod(){
  myX = 1030;
  myY = (int)(Math.random()*900 +50);
  myLength = 30;
  myWidth = 30;
  mySpeed = (int)(Math.random() * 10 + 5);
  }
  void fly() {
    myX -= mySpeed;
  }
  void show() {
    fill(128,128,128);
    ellipse(myX, myY, myLength, myWidth);
    fill(90,90,90);
    ellipse(myX+2,myY+1, myLength-27,myWidth-27);
  }
}

ship [] ben = new ship[30];
particle [] bob = new particle [3000];
Stars [] dave = new Stars[1000];
STAR2 [] ryan = new STAR2[500];
asteriod [] jimmy = new asteriod[40];
void setup() {
  size(1000,1000);
  fill(255,255,255);
  for (int i = 0; i < bob.length; i ++) {
     bob[i] = new particle();
  }
for ( int i = 0; i < dave.length; i ++) {
 dave[i] = new Stars();
}
for ( int i = 0; i < ryan.length; i ++) {
  ryan[i] = new STAR2();
}
for ( int i = 0; i < ben.length; i ++) {
  ben[i] = new ship();
}
for ( int i =0; i < jimmy.length; i ++) {
  jimmy[i] = new asteriod();
}
}

void draw() {
    background(0,0,0);
  for ( int i = 0; i < ryan.length; i ++) {
   if ( bob[i].myX == 1600 || bob[i].myX == -600 || bob[i].myY == 1600 || bob[i].myY == -600) {
    ryan[i].myX = 500;
    ryan[i].myY = 500;
    }
  }
  for ( int a = 0; a < ryan.length; a++) {
    if ( ryan[a].myX > 1600 || ryan[a].myX < -600 || ryan[a].myY > 1600 || ryan[a].myY < -600) {
    ryan[a].myX = 500;
    ryan[a].myY = 500;
    }
  }
  for ( int b = 0; b < ben.length; b++) {
    if ( ben[b].myX > 1200) {
    ben[b].myX = -30;
    ben[b].myY = (int)(Math.random()*900 + 50);
    }
  }
   for ( int c = 0; c < jimmy.length; c++) {
    if ( jimmy[c].myX < -200) {
    jimmy[c].myX = 1030;
    jimmy[c].myY = (int)(Math.random()*900 + 50);
    }
  }
  
  //reshow for out of frame
  
  //show when _ happens
  for ( int i = 0; i < bob.length; i ++) {
  bob[i].show();
  bob[i].boom();
  }
  fill(255,0,0);
  for ( int i = 0; i < dave.length; i ++) {
  dave[i].show();
  dave[i].boom();
  }
  for ( int i = 0; i < ryan.length; i ++) {
     if ( bob[i].myX > 1600 || bob[i].myX < -600 || bob[i].myY > 1600 || bob[i].myY < -600) {
    ryan[i].show();
     ryan[i].boom();
    }
  }
  for ( int i = 0; i < ben.length; i++){
    if ( bob[i].myX > 2300 || bob[i].myX < -1300 || bob[i].myY > 2300 || bob[i].myY < -1300) {
    ben[i].show();
    ben[i].fly();
  }
  }
  for ( int i = 0; i < jimmy.length; i++){
    if ( bob[i].myX > 2500 || bob[i].myX < -1500 || bob[i].myY > 2500 || bob[i].myY < -1500) {
    jimmy[i].show();
    jimmy[i].fly();
  }
  }
  
  
}//end draw

void mousePressed() {
   for ( int i = 0; i < dave.length; i ++) {
     dave[i].myX = 500;
     dave[i].myY = 500;
   }
   for ( int i = 0; i < bob.length; i ++) {
     bob[i].myX = 500;
     bob[i].myY = 500;
   }
   for ( int i = 0; i < ryan.length; i++) {
     ryan[i].myX = 500;
     ryan[i].myY = 500;
   }
}




