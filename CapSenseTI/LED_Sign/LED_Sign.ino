/*
  Blink
  The basic Energia example.
  Turns on an LED on for one second, then off for one second, repeatedly.
  Change the LED define to blink other LEDs.
  
  Hardware Required:
  * LaunchPad with an LED
  
  This example code is in the public domain.
*/

// most launchpads have a red LED
#include "WS2811Driver.h"
#include "Button_Interface.h"
#include "Wire.h"
#define LED P2_3
#define Neo_Pixel P1_6
#define Brightness P1_0
#define LED_2 P2_4

int current_time = 0;
int previous_time = 0;
int brightness_value = 0;
int brightness_value_scaled = 0;
int i;
int cycle = 0;
WS2811Driver ledStrip = WS2811Driver(6, Neo_Pixel, NEO_GRB);

//see pins_energia.h for more LED definitions
//#define LED GREEN_LED
  
// the setup routine runs once when you press reset:
void setup() {                
  // initialize the digital pin as an output.
  uint16_t i;
  
  for(i=0; i<ledStrip.numPixels(); i++)
  {
    ledStrip.setPixelColor(i, 0, 0, 0);
  }
  
  ledStrip.setBrightness(255);      //Set LED strip brightness to max
  
  ledStrip.begin();        // configure P1.6 for output
  pinMode(LED, OUTPUT); 
  void Buttons_Init(void);
}

// the loop routine runs over and over again forever:

void loop() 
{
    brightness_value = analogRead(Brightness);
    brightness_value_scaled = map(brightness_value, 0, 1023, 0, 255);
    ledStrip.setBrightness(brightness_value_scaled);
    ledStrip.show();
    analogWrite(LED_2, brightness_value_scaled);
    
    current_time = millis();
    int interval = 500;
    if ((current_time - previous_time >= interval) && (digitalRead(LED) == 0))
    {
        digitalWrite(LED, HIGH);   // turn the LED on (HIGH is the voltage level
    }
    
    if (current_time - previous_time >= (2 * interval) && (digitalRead(LED) == 1))
    {
         digitalWrite(LED, LOW);    // turn the LED off by making the voltage LOW
         previous_time = current_time;
    }

    
    if ((State_Button1() == B00) && (cycle == 0))
    {
        colorWipe(ledStrip.Color(brightness_value_scaled, 0, 0), 50);
        cycle = cycle + 1;
    }
    if ((State_Button1() == B00) && (cycle == 1))
    {
        colorWipe(ledStrip.Color(0,brightness_value_scaled, 0), 50);
        cycle = cycle + 1;
    }
    if ((State_Button1() == B00) && (cycle == 2))
    {
        colorWipe(ledStrip.Color(0, 0, brightness_value_scaled), 50);
        cycle = cycle + 1;
    }
    if ((State_Button1() == B00) && (cycle == 3))
    {
        colorWipe(ledStrip.Color(brightness_value_scaled, brightness_value_scaled, brightness_value_scaled), 50);
        cycle = cycle + 1;
    }
    
    if ((State_Button1() == B00) && (cycle == 4))
    {
        colorWipe(ledStrip.Color(0, 0, 0), 50);
        cycle = 0;
    }
    
    if (cycle == 4)
    {
        cycle = 0;
    }
    
    if (State_Button2() == B00)
    {
        for (i=0; i<3; i++)
        {
        theaterChase(ledStrip.Color(brightness_value_scaled, brightness_value_scaled, brightness_value_scaled), 50);
        theaterChase(ledStrip.Color(brightness_value_scaled,   0,   0), 50); 
        theaterChase(ledStrip.Color(0,0, brightness_value_scaled), 50); 
        }
        colorWipe(ledStrip.Color(brightness_value_scaled, brightness_value_scaled, brightness_value_scaled), 50);
    }
    
    if (State_Button3() == B00)
    {
        rainbowCycle(20);
        colorWipe(ledStrip.Color(brightness_value_scaled, brightness_value_scaled, brightness_value_scaled), 50);
    }
    
    if (State_Button4() == B00)
    {
        colorWipe(ledStrip.Color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255))), 50);
    }
    
}

// Fill the dots one after the other with a color
void colorWipe(uint32_t c, uint8_t wait) {
  for(uint16_t i=0; i<ledStrip.numPixels(); i++) {
      ledStrip.setPixelColor(i, c);
      brightness_value = analogRead(Brightness);
      brightness_value_scaled = map(brightness_value, 0, 1023, 0, 255);
      ledStrip.setBrightness(brightness_value_scaled);
      ledStrip.show();
      delay(wait);
  }
}

void rainbowCycle(uint8_t wait) {
  uint16_t i, j;

  for(j=0; j<256*3; j++) { // 5 cycles of all colors on wheel
    for(i=0; i< ledStrip.numPixels(); i++) {
      ledStrip.setPixelColor(i, Wheel(((i * 256 / ledStrip.numPixels()) + j) & 255));
    }
    brightness_value = analogRead(Brightness);
    brightness_value_scaled = map(brightness_value, 0, 1023, 0, 255);
    ledStrip.setBrightness(brightness_value_scaled);
    ledStrip.show();
    delay(wait);
  }
}

//Theatre-style crawling lights.
void theaterChase(uint32_t c, uint8_t wait) {
  for (int j=0; j<10; j++) {  //do 10 cycles of chasing
    for (int q=0; q < 3; q++) {
      for (int i=0; i < ledStrip.numPixels(); i=i+3) {
        ledStrip.setPixelColor(i+q, c);    //turn every third pixel on
        ledStrip.setBrightness(brightness_value_scaled);
      }
      brightness_value = analogRead(Brightness);
      brightness_value_scaled = map(brightness_value, 0, 1023, 0, 255);
      ledStrip.setBrightness(brightness_value_scaled);
      ledStrip.show();
     
      delay(wait);
     
      for (int i=0; i < ledStrip.numPixels(); i=i+3) {
        ledStrip.setPixelColor(i+q, 0);        //turn every third pixel off
      }
    }
  }
}

//Theatre-style crawling lights with rainbow effect
void theaterChaseRainbow(uint8_t wait) {
  for (int j=0; j < 256; j++) {     // cycle all 256 colors in the wheel
    for (int q=0; q < 3; q++) {
        for (int i=0; i < ledStrip.numPixels(); i=i+3) {
          ledStrip.setPixelColor(i+q, Wheel( (i+j) % 255));    //turn every third pixel on
        }
        brightness_value = analogRead(Brightness);
        brightness_value_scaled = map(brightness_value, 0, 1023, 0, 255);
        ledStrip.setBrightness(brightness_value_scaled);
        ledStrip.show();
       
        delay(wait);
       
        for (int i=0; i < ledStrip.numPixels(); i=i+3) {
          ledStrip.setPixelColor(i+q, 0);        //turn every third pixel off
        }
    }
  }
}

uint32_t Wheel(byte WheelPos) {
  if(WheelPos < 85) {
   return ledStrip.Color(WheelPos * 3, 255 - WheelPos * 3, 0);
  } else if(WheelPos < 170) {
   WheelPos -= 85;
   return ledStrip.Color(255 - WheelPos * 3, 0, WheelPos * 3);
  } else {
   WheelPos -= 170;
   return ledStrip.Color(0, WheelPos * 3, 255 - WheelPos * 3);
  }
}