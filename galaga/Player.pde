public class Player{
  float xMax;
  float yMax;
  float xCor;
  float yCor;
  boolean left;
  boolean right;
  boolean up;
  boolean down;
  
  
  Player(float w, float h){
    xMax = w;
    yMax = h;
    xCor = w / 2;
    yCor = h * 0.9;
    left = false;
    right = false;
    up = false;
    down = false;
  }
  
  void display(){
    fill(255);
    triangle(xCor - 20, yCor + 40, xCor, yCor, xCor + 20, yCor + 40);
    fill(0);
    ellipse(xCor + 5, yCor + 20, 2, 2);
    ellipse(xCor - 5, yCor + 20, 2, 2);
    rect(xCor - 5, yCor + 30, 10, 2);
    for (Bullet b : bullets) {
      b.move();
      b.display();
    }
  }
  
  void shoot() {
    Bullet toAdd = new Bullet(xCor, yCor, 0);
    bullets.add(toAdd);
  }
  
}
