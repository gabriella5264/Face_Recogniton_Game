class Sandwich{
  int locationX;
  int locationY;
  boolean falling;
  int timeToDisplay;
  int fallingSpeed;
  PImage[] sandwich = new PImage [3];
  int sandCounter = 0;
  
  Sandwich(){
    locationY = 0;
    locationX = (int)random(0,600);
    //bucket should not be falling
    falling = false;
    //when the bucket should fall
    timeToDisplay = (int)random(2,600);
    fallingSpeed = (int)random(2,5);
    for(int i = 0; i < 3 ; i++)
    {
      sandwich[i] = loadImage("sandwich/sandwich"+ i + ".png");
    }
  }
  
  void display(){
    image(sandwich[int(sandCounter/10)], locationX, locationY);
          sandCounter++;
        
          if(sandCounter >= 30)
          {
            sandCounter = 0;
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
