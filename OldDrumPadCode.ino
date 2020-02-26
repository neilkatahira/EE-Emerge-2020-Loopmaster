//int ledPin = P1_0;// LED connected to digital pin 
//int inPin = 0;
//int val = 0;       // variable to store the read value
/*
  created 21 November 2006
  by David A. Mellis
  modified 30 Aug 2011
  by Limor Fried
  modified 27 Apr 2012
  Robert Wessels
  This example code is in the public domain.
*/
long lastDebounceTime = 0;  // the last time the output pin was toggled
long debounceDelay = 50;    // the debounce time; increase if the output flickers
int buttonState;
// Variables will change:
//int ledState = HIGH;         // the current state of the output pin
//int buttonState;             // the current reading from the input pin
int lastButtonState = 0;   // the previous reading from the input pin
void setup()
{ 
  Serial.begin(115200);
  //pinMode(P1_6, OUTPUT);      // sets the digital pin as output
  pinMode(P2_6, INPUT);
  pinMode(P2_0, INPUT);
  pinMode(P2_1, INPUT);
  pinMode(P2_2, INPUT);
  pinMode(P2_4, INPUT);
  // sets the digital pin as input
}
void loop()
{
  //val = digitalRead(P1_1);     // read the input pin
  //digitalWrite(ledPin, val);    // sets the LED to the button's value
//    if (digitalRead(P2_6) == 1)
//      {
//        Serial.write("a");
//        
//         if (digitalRead(P2_6) != lastButtonState) 
//         {
//        // reset the debouncing timer
//        lastDebounceTime = millis();
//       }
//        if ((millis( ) - lastDebounceTime) > debounceDelay) 
//        {
//        buttonState = digitalRead(P2_6);
//      }
//      Serial.write("a");
//      lastButtonState=digitalRead(P2_6);
//      }
    if (digitalRead(P2_0) == 1)
      {
        Serial.write("b");
       
        //digitalWrite(P1_6, 1);
      }
    if (digitalRead(P2_1) == 1)
      {
        Serial.write("c");
        
        //digitalWrite(P1_6, 1);
      }
    if (digitalRead(P2_2) == 1)
      {
        Serial.write("d");
        
      }
    if (digitalRead(P2_4) == 1)
      {
        Serial.write("e");
        
      }
          if (digitalRead(P2_6) == 1)
      {
        Serial.write("a");
        
      }
      
      
}
