import java.util.*;
public class BackBubbles {
  float xCor;
  float xMax;
  float yMax;
  float yCor;
  color baseC;
  BackBubbles(int w, int h) {
    xMax = w;
    xCor = (float) (random(w));
    yMax = (float) (h);
    yCor= (float) (random(h));
    baseC = color(random(255), random(255), random(255));
  }
  
  void move() {
    double toAdd = 10;
    double mult = Math.random();
    if (mult < 0.3) {
      toAdd = mult * (yMax / 10);
    }
    else if (mult < 0.6) {
      toAdd = mult * (yMax / 15);
    }
    else {
      toAdd *= mult;
    }
    yCor+= (float)toAdd;
    if (yCor> yMax) {
      yCor= 0;
      baseC = color(random(255), random(255), random(255));
    }
  }
  
  void display() {
    
    fill(baseC);
    ellipse(xCor, yCor, 3, 3);
  }
  
}
