import java.util.*;
public class BackBubbles {
  float xCor;
  float xMax;
  float yMax;
  float y;
  color baseC;
  
  BackBubbles(int w, int h) {
    xMax = w;
    xCor = (float) (random(w));
    yMax = (float) (h);
    y = (float) (random(h));
    baseC = color(random(255), random(255), random(255));
  }
  
  void move() {
    double toAdd = 10;
    double mult = Math.random();
    if (mult < 0.3) {
      toAdd = mult * (yMax / 200);
    }
    else if (mult < 0.6) {
      toAdd = mult * (yMax / 100);
    }
    else {
      toAdd *= mult;
    }
    y += (float)toAdd;
    if (y > yMax) {
      y = 0;
      baseC = color(random(255), random(255), random(255));
    }
  }
  
  void display() {
    
    fill(baseC);
    ellipse(xCor, y, 3, 3);
  }
  
}
