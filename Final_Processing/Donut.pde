class Donut{
  int locationX;
  int locationY;
  boolean falling;
  int timeToDisplay;
  int fallingSpeed;
  PImage[] donut = new PImage [3];
  int donutCounter = 0;
  
  Donut(){
    locationY = 0;
    locationX = (int)random(0,600);
    //bucket should not be falling
    falling = false;
    //when the bucket should fall
    timeToDisplay = (int)random(2,600);
    fallingSpeed = (int)random(2,5);
    for(int i = 0; i < 3 ; i++)
    {
      donut[i] = loadImage("donut/donut"+ i + ".png");
    }
  }
  
  void display(){
    image(donut[int(donutCounter/10)], locationX, locationY);
          donutCounter++;
        
          if(donutCounter >= 30)
          {
            donutCounter = 0;
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
