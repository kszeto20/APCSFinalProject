public class Player{
  float xCor;
  float yCor;
  
  Player(float w, float h){
    xCor = w / 2;
    yCor = h * 0.9;
  }
  
  void move(){
    if(keyCode == 37 && xCor > 30){
        xCor -= 10;
     }
     if(keyCode == 39 && xCor < width - 30){
       xCor += 10;
     }
   }    
  
  
  void display(){
    fill(255);
    triangle(xCor - 20, yCor + 40, xCor, yCor, xCor + 20, yCor + 40);
    fill(0);
    ellipse(xCor + 5, yCor + 20, 2, 2);
    ellipse(xCor - 5, yCor + 20, 2, 2);
    rect(xCor - 5, yCor + 30, 10, 2);
  }
  
}
