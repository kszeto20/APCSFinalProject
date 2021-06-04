public class Enemy{
  float xCor;
  float yCor;
  float dx;
  float dy;
  float yMax;
  boolean kill;
  
  Enemy(float w, float h){
    yMax = h;
    xCor = w / 2;
    yCor = h * 0.1;
    dx = 5;
    dy = 50;
  }
  
  void display(){
    fill(255, 0, 0);
    triangle(xCor - 20, yCor - 40, xCor, yCor, xCor + 20, yCor - 40);
    fill(255);
    noStroke();
    ellipse(xCor + 5, yCor - 20, 2, 2);
    ellipse(xCor - 5, yCor - 20, 2, 2);
    rect(xCor - 5, yCor - 30, 10, 2);       
    for (Bullet b : otherBullets) {
      b.move();
      b.display();
    }
  }
 
  void move(){
    xCor += dx;
    // flip dir when bounds are touched
    // left bound
    if (xCor < width * 0.2) {
      xCor = width * 0.2 + 1;
      dx *= -1;

      //yCor += dy;
    }
    //right bound
    if (xCor > width * 0.8) {
      xCor = width * 0.8 - 1;
      dx *= -1; 
      //yCor += dy;
    }
    // loops back to the top
    //if (yCor > yMax) {
    //  yCor = yMax * 0.1;
    //}
  }
  
  void shoot(){
    double r = random(10);
    if (r < 2) {
      Bullet toAdd = new Bullet(xCor, yCor - 30, 1);
      otherBullets.add(toAdd);
    }
  }
}
