public class Enemy{
  float xCor;
  float yCor;
  float dx;
  float dy;

  Enemy(float w, float h){
    xCor = w / 2;
    yCor = h * 0.1;
    dx = 5;
    dy = 5;
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
    if(xCor <= width / 2  && xCor > 30){
      xCor -= dx;
    }
    if(xCor == width / 2 - 200){
      xCor += dx + 5;
    }
  }
  
  void shoot(){
    Bullet toAdd = new Bullet(xCor, yCor - 30, 1);
    otherBullets.add(toAdd);
  }
}
