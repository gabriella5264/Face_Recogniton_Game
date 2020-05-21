class Avocado{
  
  //setting variables
  int locationX;
  int locationY;
  boolean falling;
  int timeToDisplay;
  int fallingSpeed;
  PImage[] avo = new PImage [3];
  int avoCounter = 0;
  
  Avocado(){
    locationY = 0;
    locationX = (int)random(0,600);//random x coordinates
    falling = false;
    timeToDisplay = (int)random(2,600);//random time to display
    fallingSpeed = (int)random(2,5);//random falling speed
    
    for(int i = 0; i < 3 ; i++)
    {
      avo[i] = loadImage("avo/avo"+ i + ".png");
    }
  }
  
  void display(){
    
        image(avo[int(avoCounter/10)], locationX, locationY);
          avoCounter++;
        
          if(avoCounter >= 30)
          {
            avoCounter = 0;
          }
  }
  
  //update the y coordinates of the objects
  void fall(){
    locationY +=fallingSpeed;
  }
  
  //to run fall()
  void makeDrop(){
    falling = true;
  }
  
 //when the face catch the object, update the location to the out of the screen, score and play the sound
  void caught(){
    
    fallingSpeed = 0;
    locationX = 999;
    eatSound.play(0);
    Caught++;
  }
  
  //when the face miss the object, update the location to the out of the screen
  void miss(){
   fallingSpeed = 0;
  locationY = -100; 
  }
}
