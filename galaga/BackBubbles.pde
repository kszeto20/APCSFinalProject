import java.util.*;
public class BackBubbles {
  float xCor;
  float yMax;
  float y;
  BackBubbles(int w, int h) {
    xCor = (float) (random(w));
    yMax = (float) (h);
    y = (float) (random(h));
  }
  
  void move() {
    double toAdd = 10;
    double mult = Math.random();
    if (mult < 0.3) {
      toAdd = mult * (yMax / 6);
    }
    y += (float)toAdd;
    if (y > yMax) {
      y = 0;
    }
  }
  
  void display() {
    color newC = color(random(255), random(255), random(255));
    fill(newC);
    ellipse(xCor, y, 5, 5);
  }
  
}
