public class Bullet{ 
  float xCor;  
  float yCor;
  float yCorOG;
  float typeP;
  
  Bullet(float x, float y, float type) {
    xCor = x;
    yCor = y;
    // type = type of plane (enemy / player); 0 == player type, 1 == enemy type
    typeP = type;

  }
  
  void display() {
    fill(255, 0, 0);
    rect(xCor - 2, yCor, 5, 20, 2);
  }
  
  void move(){  
    if (typeP == 0) {
      yCor -= 25;
    }
    else if (typeP == 1) {
      yCor += 25;
    }
  }
  // neeed a collide method with arraylist of all enemy ships
}
