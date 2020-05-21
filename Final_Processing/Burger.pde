class Burger{
  int locationX;
  int locationY;
  boolean falling;
  int timeToDisplay;
  int fallingSpeed;
  PImage[] burger = new PImage [3];
  int burgerCounter = 0;
  
  Burger(){
    locationY = 0;
    locationX = (int)random(0,600);
    //bucket should not be falling
    falling = false;
    //when the bucket should fall
    timeToDisplay = (int)random(2,600);
    fallingSpeed = (int)random(2,5);
    for(int i = 0; i < 3 ; i++)
    {
      burger[i] = loadImage("burger/burger"+ i + ".png");
    }
  }
  
  void display(){
    image(burger[int(burgerCounter/10)], locationX, locationY);
          burgerCounter++;
        
          if(burgerCounter >= 30)
          {
            burgerCounter = 0;
          }         
  }
  
  void fall(){
    locationY +=fallingSpeed;
  }
  
  void makeDrop(){
    falling = true;
  }
 //these two methods put the drop off the screen 
  void caught(){
    
    fallingSpeed = 0;
    locationX = 999;
    hitSound.play(0);
    Missed++;
  }
  void miss(){
   fallingSpeed = 0;
  locationY = -100; 
  }
  
}
