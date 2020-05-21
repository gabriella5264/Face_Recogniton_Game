/*
 * Author: SMRAZA KEEN
 * Date:2016/6/29
 * IDE V1.6.9
 * Email:TechnicSmraza@outlook.com
 * Function:
 */
// initialize the library with the numbers of the interface pins
#include <LiquidCrystal.h>
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

char val;
int redPin1 = 8;
int redPin2 = 10;
int redPin3 = 13;
int greenPin1 = 9;
int greenPin2 = 6;
int greenPin3 = 7;

void setup()                                                                                     
{
// set up the LCD's number of columns and rows:
  lcd.begin(16,2);
  Serial.begin(9600);
  pinMode(redPin1, OUTPUT);
  pinMode(redPin2, OUTPUT);
  pinMode(redPin3, OUTPUT);
  pinMode(greenPin1, OUTPUT);
  pinMode(greenPin2, OUTPUT);
  pinMode(greenPin3, OUTPUT);

}
void loop()
{

  val = Serial.read();
// Print a message to the LCD.

  if(val == '0')
  {
    lcd.clear();
    lcd.println("Enjoy the");
    lcd.setCursor(0, 1);
    lcd.println("   Healthy Food!");
  }
  

  else if(val == '1')
  {
    lcd.clear();
    lcd.println("Enjoy the");
    lcd.setCursor(0, 1);
    lcd.println("   Healthy Food!");

    digitalWrite(redPin1, HIGH);

  }
  else if(val == '2')
  {
    lcd.clear();
    lcd.println("Enjoy the");
    lcd.setCursor(0, 1);
    lcd.println("   Healthy Food!");
    digitalWrite(redPin2, HIGH);
    
    
  }
  else if(val == '3')
  {
    lcd.clear();
    lcd.println("Game Over!");
    digitalWrite(redPin3, HIGH);

    
  }

  else if(val == '4')
  {
    lcd.clear();
    lcd.println("Enjoy the");
    lcd.setCursor(0, 1);
    lcd.println("   Healthy Food!");

    digitalWrite(greenPin1, HIGH);

  }

  else if(val == '5')
  {
    lcd.clear();
    lcd.println("Enjoy the");
    lcd.setCursor(0, 1);
    lcd.println("   Healthy Food!");

    digitalWrite(greenPin2, HIGH);
    
  }

  else if(val == '6')
  {
    lcd.clear();
    lcd.println("Well Done!");

    digitalWrite(greenPin3, HIGH);
  }

  else if (val == '8')
  {
    digitalWrite(redPin2, LOW);
    digitalWrite(redPin1, LOW);
    digitalWrite(redPin3, LOW);
  }
 }
