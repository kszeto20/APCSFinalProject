public class Enemy{
  float xCor;
  float yCor;
  
  Enemy(float w, float h){
    xCor = w / 2;
    yCor = h * 0.1;
  }
  
  void display(){
    fill(255, 0, 0);
    triangle(xCor - 20, yCor - 40, xCor, yCor, xCor + 20, yCor - 40);
    fill(255);
    noStroke();
    ellipse(xCor + 5, yCor - 20, 2, 2);
    ellipse(xCor - 5, yCor - 20, 2, 2);
    rect(xCor - 5, yCor - 30, 10, 2);       
    for (Bullet b : bullets) {
      b.move();
      b.display();
    }
  }
 
  void move(){
    double prob = Math.random();
    if(prob < 0.3){
      xCor -= 20;
    }
    if(prob > 0.6){
      xCor += 20;
    }
  }
}
