//int ledPin = P1_0;// LED connected to digital pin 
//int inPin = 0;
//int val = 0;       // variable to store the read value
//long lastDebounceTime = 0;  // the last time the output pin was toggled
//long debounceDelay = 50;    // the debounce time; increase if the output flickers
//int buttonState;
//int lastButtonState = 0;
int flag1_6 = 0, flag1_4 = 0; //etc
void setup()
{ 
  Serial.begin(9600);
  //pinMode(P1_6, OUTPUT);      // sets the digital pin as output
  pinMode(P1_6, INPUT);
  pinMode(P1_4, INPUT);
  pinMode(P1_5, INPUT);
  pinMode(P1_7, INPUT);
  pinMode(P2_0, INPUT);
  pinMode(P2_1, INPUT);
  pinMode(P2_2, INPUT);
  pinMode(P2_3, INPUT);
  pinMode(P2_4, INPUT);
  pinMode(P2_5, INPUT);
  pinMode(P2_6, INPUT);
  pinMode(P2_7, INPUT);
  // sets the digital pin as input
}
void loop()
{
  //val = digitalRead(P1_1);     // read the input pin
  //digitalWrite(ledPin, val);    // sets the LED to the button's value
    if (digitalRead(P1_6) > flag1_6)
      { //checks if the pin is pressed, and hasnt been pressed
          Serial.write("a");
          pressed1_6 = 1;
      }
    else if (digitalRead(P1_6) < flag1_6)
      {//checks if the pin has been presss, and is no longer pressed
          Serial.write("x");
          pressed1_6 = 0;
      }
// if neither of these conditions are met, nothing happens
// eg. pin has been pressed & hasnt been released 
//  or pin has not been pressed
  
//    if (digitalRead(P1_4) == 1)
//      {
//        Serial.write("b");
//       
        //digitalWrite(P1_6, 1);
//      }
//      else 
//      {
//      Serial.write("x");
//      }
//    if (digitalRead(P1_5) == 1)
//      {
//        Serial.write("c");
//        
//        //digitalWrite(P1_6, 1);
//      }
//      else 
//      {
//      Serial.write("x");
//      }
//    if (digitalRead(P1_7) == 1)
//      {
//        Serial.write("d");
//        
//      }
//      else 
//      {
//      Serial.write("x");
//      }
//    if (digitalRead(P2_0) == 1)
//      {
//        Serial.write("e");
//        
//      }
//      else 
//      {
//      Serial.write("x");
//      }
//    if (digitalRead(P2_1) == 1)
//      {
//        Serial.write("f");
//        
//      }
//      else 
//      {
//      Serial.write("x");
//      }
//    if (digitalRead(P2_2) == 1)
//      {
//        Serial.write("g");
//        
//      }
//      else 
//      {
//      Serial.write("x");
//      }
//    if (digitalRead(P2_3) == 1)
//      {
//        Serial.write("h");
//        
//      }
//      else 
//      {
//      Serial.write("x");
//      }
//    if (digitalRead(P2_4) == 1)
//      {
//        Serial.write("i");
//        
//      }
//      else 
//      {
//      Serial.write("x");
//      }
//    if (digitalRead(P2_5) == 1)
//      {
//        Serial.write("j");
//       
//      }
//      else 
//      {
//      Serial.write("x");
//      }
//    if (digitalRead(P2_6) == 1)
//      {
//        Serial.write("k");
//        
//      }
//      else 
//      {
//      Serial.write("x");
//      }
//    if (digitalRead(P2_7) == 1)
//      {
//        Serial.write("l");
//        
//      }
//      else 
//      {
//      Serial.write("x");
//      }
      
}
