public class Bullet {
  float xMax;
  float yMax;
  float xCor;
  float yCor;
  float yCorOG;
  float typeP;
  
  Bullet(float xMax, float yMax, float x, float y, float type) {
    this.xMax = xMax;
    this.yMax = yMax;
    xCor = x;
    yCor = y;
    // type = type of plane (enemy / player); 0 == player type, 1 == enemy type
    typeP = type;

  }
  
  void display() {
    fill(255, 0, 0);
    rect(xCor - 2, yCor, 5, 20, 2);
  }
  
  void move() {
    if (typeP == 0) {
      yCor -= 10;
    }
    else if (typeP == 1) {
      yCor += 10;
    }
    if (yCor > yMax || yCor < 0) {
      bullets.remove(this);
    }
  }
  // neeed a collide method with arraylist of all enemy ships
}
