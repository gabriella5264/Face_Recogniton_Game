class Carrot{
  int locationX;
  int locationY;
  boolean falling;
  int timeToDisplay;
  int fallingSpeed;
  PImage[] carrot = new PImage [3];
  int carrotCounter = 0;
  
  Carrot(){
    locationY = 0;
    locationX = (int)random(0,600);
    //bucket should not be falling
    falling = false;
    //when the bucket should fall
    timeToDisplay = (int)random(2,600);
    fallingSpeed = (int)random(2,5);
    for(int i = 0; i < 3 ; i++)
    {
      carrot[i] = loadImage("carrot/carrot"+ i + ".png");
    }
  }
  
  void display(){
    image(carrot[int(carrotCounter/10)], locationX, locationY);
          carrotCounter++;
        
          if(carrotCounter >= 30)
          {
            carrotCounter = 0;
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
    eatSound.play(0);
    Caught++;
  }
  void miss(){
   fallingSpeed = 0;
  locationY = -100; 
  }
  
}
