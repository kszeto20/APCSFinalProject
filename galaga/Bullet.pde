public class Bullet{ 
  float xCor;  
  float yCor;
  float typeP;
  
  Bullet(float x, float y, float type) {
    xCor = x;
    yCor = y;
    // type = type of plane (enemy / player); 0 == player type, 1 == enemy type
    typeP = type;

  }
  
  void display() {
    if (typeP == 0) {
      fill(255, 0, 0);
      rect(xCor - 2, yCor, 5, 20, 2);
    }
    else if (typeP == 1) {
      fill(252, 8, 44);
      rect(xCor - 2, yCor, 5, 20, 2);
    }
    
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
