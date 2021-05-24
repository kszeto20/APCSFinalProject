import java.util.*;
public class BackBubbles {
  float xCor;
  float yMax;
  float y;
  BackBubbles(int w, int h) {
    xCor = (float) (Math.random() * w);
    yMax = (float) (h);
    y = (float) (Math.random() * h);
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
    //int mult = (int)Math.random() * 225;
    //color newC = color(mult);
    fill(225);
    ellipse(xCor, y, 5, 5);
  }
  
}
