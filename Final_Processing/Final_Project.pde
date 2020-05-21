//import the libraries
import processing.video.*;
import gab.opencv.*;
import java.awt.*;
import ddf.minim.*;
import processing.serial.*;//with arduino controller 
import processing.sound.*;

//define the objects
Capture video;
OpenCV opencv;
AudioSnippet eatSound, hitSound, background, won, lost;
Minim minim;
Serial myPort;

//create object arrays
Icecream[] icecream = new Icecream[40];
Avocado[] avocado = new Avocado[40];
Broccoli[] broccoli = new Broccoli[40];
Burger[] burger = new Burger[40];
Carrot[] carrot = new Carrot[40];
Donut[] donut = new Donut[40];
Sandwich[] sandwich = new Sandwich[40];
Watermelon[] watermelon = new Watermelon[40];
Sushi[] sushi = new Sushi[40];

//variables
int Caught = 0;
int Missed = 0;
int gameScreen = 0;
int special = 0;
PImage winner;
PImage loser;

void setup()
{  
  
  //screen size
  size(640, 480);
  
  winner = loadImage("winner.jpg");
  loser = loadImage("loser.jpg");
  
  //create a video object
  video = new Capture(this, 640, 480);
  //start the video
  video.start();
  
  //calling sounds
  minim = new Minim(this);
  eatSound = minim.loadSnippet("blop.mp3");
  hitSound = minim.loadSnippet("poke.mp3");
  won = minim.loadSnippet("clapping.mp3");
  lost = minim.loadSnippet("lost.mp3");
  background = minim.loadSnippet("background.mp3");

//create openCV
  opencv = new OpenCV(this, video.width, video.height);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);


//create the objects
  for (int i = 0; i<icecream.length; i++)
  {
    icecream[i] = new Icecream();
  }
  for (int i = 0; i<avocado.length; i++)
  {
    avocado[i] = new Avocado();
  }
  for (int i = 0; i<broccoli.length; i++)
  {
    broccoli[i] = new Broccoli();
  }
  for (int i = 0; i<burger.length; i++)
  {
    burger[i] = new Burger();
  }
  for (int i = 0; i<carrot.length; i++)
  {
    carrot[i] = new Carrot();
  }
  for (int i = 0; i<donut.length; i++)
  {
    donut[i] = new Donut();
  }
  for (int i = 0; i<sandwich.length; i++)
  {
    sandwich[i] = new Sandwich();
  }
  for (int i = 0; i<watermelon.length; i++)
  {
    watermelon[i] = new Watermelon();
  }
  for (int i = 0; i<sushi.length; i++)
  {
    sushi[i] = new Sushi();
  }
  
}

void draw()
{
  //setting game screen
  if(gameScreen == 0)
  {
    background.play();
    gameDisplay();
    
  }
  
  else if(gameScreen == 1)
  {
    background.pause();
    won.play();
    Winner();
  }
  
  else if(gameScreen == 2)
  {
    background.pause();
    lost.play();
    Loser();
  }
}

void gameDisplay()
{
//flip the video
  pushMatrix();
  scale(-1, 1);
  translate(-video.width, 0);

  if (video.available())
  {
    video.read();
  }

//load video frames into openCV
  opencv.loadImage(video);

//detect thae faces from video frames
  Rectangle[] faces = opencv.detect();
  image(video, 0, 0);

//grab the face
  if (faces.length !=0)
  {
    //while making objects in certain time, make the objects drop
    for (int i = 0; i<icecream.length; i++) 
  {
    if ((int)(millis()/1000) ==icecream[i].timeToDisplay) 
    {
      icecream[i].makeDrop();
    }
  }

  for (int i=0; i<icecream.length; i++) 
  {
    
    //if the ojbects are falling, fuction display and fall
    if (icecream[i].falling) {
      icecream[i].display();
      icecream[i].fall();
    }
    
    //if the objects are inside the faced rectangle, function caught
    if (icecream[i].locationY >= faces[0].y && icecream[i].locationY <= (faces[0].y + faces[0].height) && icecream[i].locationX >= faces[0].x && icecream[i].locationX <= faces[0].x + faces[0].width) 
    {
      icecream[i].caught();
    }
    
    //if the y coordinate of the objects are out of the screen, function miss
    if (icecream[i].locationY>480) {
      icecream[i].miss();
    }
  }

  for (int i = 0; i<avocado.length; i++) 
  {
    if ((int)(millis()/1000) ==avocado[i].timeToDisplay) 
    {
      avocado[i].makeDrop();
    }
  }

  for (int i=0; i<avocado.length; i++) 
  {

    if (avocado[i].falling) {
      avocado[i].display();
      avocado[i].fall();
    }

    if (avocado[i].locationY >= faces[0].y && avocado[i].locationY <= (faces[0].y + faces[0].height) && avocado[i].locationX >= faces[0].x && avocado[i].locationX <= faces[0].x + faces[0].width) 
    {
      avocado[i].caught();
    }

    if (avocado[i].locationY>480) {
      avocado[i].miss();
    }
  }

  for (int i = 0; i<broccoli.length; i++) 
  {
    if ((int)(millis()/1000) ==broccoli[i].timeToDisplay) 
    {
      broccoli[i].makeDrop();
    }
  }

  for (int i=0; i<broccoli.length; i++) 
  {

    if (broccoli[i].falling) {
      broccoli[i].display();
      broccoli[i].fall();
    }
    
    if (broccoli[i].locationY >= faces[0].y && broccoli[i].locationY <= (faces[0].y + faces[0].height) && broccoli[i].locationX >= faces[0].x && broccoli[i].locationX <= faces[0].x + faces[0].width) 
    {
      broccoli[i].caught();
    }

    if (broccoli[i].locationY>480) {
      broccoli[i].miss();
    }
  }

  for (int i = 0; i<burger.length; i++) 
  {
    if ((int)(millis()/1000) ==burger[i].timeToDisplay) 
    {
      burger[i].makeDrop();
    }
  }

  for (int i=0; i<burger.length; i++) 
  {

    if (burger[i].falling) {
      burger[i].display();
      burger[i].fall();
    }
    
    if (burger[i].locationY >= faces[0].y && burger[i].locationY <= (faces[0].y + faces[0].height) && burger[i].locationX >= faces[0].x && burger[i].locationX <= faces[0].x + faces[0].width) 
    {
      burger[i].caught();
    }

    if (burger[i].locationY>480) {
      burger[i].miss();
    }
  }

  for (int i = 0; i<carrot.length; i++) 
  {
    if ((int)(millis()/1000) ==carrot[i].timeToDisplay) 
    {
      carrot[i].makeDrop();
    }
  }

  for (int i=0; i<carrot.length; i++) 
  {

    if (carrot[i].falling) {
      carrot[i].display();
      carrot[i].fall();
    }
    
    if (carrot[i].locationY >= faces[0].y && carrot[i].locationY <= (faces[0].y + faces[0].height) && carrot[i].locationX >= faces[0].x && carrot[i].locationX <= faces[0].x + faces[0].width) 
    {
      carrot[i].caught();
    }

    if (carrot[i].locationY>480) {
      carrot[i].miss();
    }
  }

  for (int i = 0; i<donut.length; i++) 
  {
    if ((int)(millis()/1000) ==donut[i].timeToDisplay) 
    {
      donut[i].makeDrop();
    }
  }

  for (int i=0; i<donut.length; i++) 
  {

    if (donut[i].falling) {
      donut[i].display();
      donut[i].fall();
    }
    
    if (donut[i].locationY >= faces[0].y && donut[i].locationY <= (faces[0].y + faces[0].height) && donut[i].locationX >= faces[0].x && donut[i].locationX <= faces[0].x + faces[0].width) 
    {
      donut[i].caught();
    }

    if (donut[i].locationY>480) {
      donut[i].miss();
    }
  }

  for (int i = 0; i<sandwich.length; i++) 
  {
    if ((int)(millis()/1000) ==sandwich[i].timeToDisplay) 
    {
      sandwich[i].makeDrop();
    }
  }

  for (int i=0; i<sandwich.length; i++) 
  {

    if (sandwich[i].falling) {
      sandwich[i].display();
      sandwich[i].fall();
    }
    
    if (sandwich[i].locationY >= faces[0].y && sandwich[i].locationY <= (faces[0].y + faces[0].height) && sandwich[i].locationX >= faces[0].x && sandwich[i].locationX <= faces[0].x + faces[0].width) 
    {
      sandwich[i].caught();
    }

    if (sandwich[i].locationY>480) {
      sandwich[i].miss();
    }
  }

  for (int i = 0; i<watermelon.length; i++) 
  {
    if ((int)(millis()/1000) ==watermelon[i].timeToDisplay) 
    {
      watermelon[i].makeDrop();
    }
  }

  for (int i=0; i<watermelon.length; i++) 
  {

    if (watermelon[i].falling) {
      watermelon[i].display();
      watermelon[i].fall();
    }
    
    if (watermelon[i].locationY >= faces[0].y && watermelon[i].locationY <= (faces[0].y + faces[0].height) && watermelon[i].locationX >= faces[0].x && watermelon[i].locationX <= faces[0].x + faces[0].width) 
    {
      watermelon[i].caught();
    }

    if (watermelon[i].locationY>480) {
      watermelon[i].miss();
    }
  }
    
    for (int i = 0; i<sushi.length; i++) 
  {
    if ((int)(millis()/1000) ==sushi[i].timeToDisplay) 
    {
      sushi[i].makeDrop();
    }
  }

  for (int i=0; i<sushi.length; i++) 
  {

    if (sushi[i].falling) {
      sushi[i].display();
      sushi[i].fall();
    }
    
    if (sushi[i].locationY >= faces[0].y && sushi[i].locationY <= (faces[0].y + faces[0].height) && sushi[i].locationX >= faces[0].x && sushi[i].locationX <= faces[0].x + faces[0].width) 
    {
      sushi[i].caught();
    }

    if (sushi[i].locationY>480) {
      sushi[i].miss();
    }
  }
    int i = 0;//grab the first face
    println(faces[i].x + "," + faces[i].y + "," + faces[i].width + "," + faces[i].height);
    
    //make rectangle around the face
    noFill();
    stroke(0, 200, 0, 100);
    strokeWeight(5);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }

//finish to the flip the video
  popMatrix();
  
  //depends of the score, send info to arduino
  
  if(special == 1)
  {
    special = 0;
    Missed = 0;
  }
  
  else if (Caught == 3)
  {
    gameScreen = 1;
    
  }
  
  if(Missed == 3)
  {
    gameScreen = 2;
  }
  
  //write scores on the screen
  textSize(20);
  text("Healthy Food: " + Caught, 100, 470);
  text("Unhealthy Food: " + Missed, 280, 470);
}

//winner screen
void Winner()
{
  image(winner, 0, 0);
}

//loser screen
void Loser()
{
  image(loser, 0, 0);
}

//read frames from the camera 
void captureEvent(Capture c) 
{   
  c.read();
}
