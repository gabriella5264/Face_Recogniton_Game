class Sushi{
  int locationX;
  int locationY;
  boolean falling;
  int timeToDisplay;
  int fallingSpeed;
  PImage[] sushi = new PImage [6];
  int sushiCounter = 0;
  
  Sushi(){
    locationY = 0;
    locationX = (int)random(0,600);
    //bucket should not be falling
    falling = false;
    //when the bucket should fall
    timeToDisplay = (int)random(2,600);
    fallingSpeed = (int)random(2,5);
    for(int i = 0; i < 6 ; i++)
    {
      sushi[i] = loadImage("sushi/sushi"+ i + ".png");
    }
  }
  
  void display(){
    image(sushi[sushiCounter], locationX, locationY);
          sushiCounter++;
        
          if(sushiCounter >= 6)
          {
            sushiCounter = 0;
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
    special++;
  }
  void miss(){
   fallingSpeed = 0;
  locationY = -100; 
  }
  
}
