int pressed = 0;
int flag1_4 = 0,
flag1_0 = 0,
flag1_3 = 0,
flag1_6 = 0,
flag1_5 = 0,
flag1_7 = 0,
flag2_0 = 0,
flag2_1 = 0,
flag2_4 = 0,
flag2_5 = 0,
flag2_6 = 0,
flag2_7 = 0;

int pin1_6state = 0,
pin1_4state = 0,
pin1_5state = 0,
pin1_7state = 0,
pin2_0state = 0,
pin2_1state = 0,
pin1_0state = 0,
pin1_3state = 0,
pin2_4state = 0,
pin2_5state = 0,
pin2_6state = 0,
pin2_7state = 0;

void setup()
{ 
  Serial.begin(115200);
  pinMode(P1_6, INPUT);
/*  pinMode(P1_4, INPUT);
 pinMode(P1_5, INPUT);
 pinMode(P1_7, INPUT);
 pinMode(P2_0, INPUT);
 pinMode(P2_1, INPUT);
 pinMode(P1_0, INPUT);
 pinMode(P1_3, INPUT);
 pinMode(P2_4, INPUT);
 pinMode(P2_5, INPUT);
 pinMode(P2_6, INPUT);
 pinMode(P2_7, INPUT); */
//   attachInterrupt(digitalPinToInterrupt(P1_6),pressed1_6,RISING);
//   attachInterrupt(digitalPinToInterrupt(P1_4),pressed1_4,RISING); 
//   attachInterrupt(digitalPinToInterrupt(P1_6),released1_6,FALLING);
//   attachInterrupt(digitalPinToInterrupt(P1_4),released1_4,FALLING);  
}
void loop()
{
    pin1_6state = digitalRead(P1_6);
    pin1_4state = digitalRead(P1_4);
    
    pin1_5state = digitalRead(P1_5);
    pin1_7state = digitalRead(P1_7);
    pin2_0state = digitalRead(P2_0);
    pin2_1state = digitalRead(P2_1);
    pin1_0state = digitalRead(P1_0);
    pin1_3state = digitalRead(P1_3);
    pin2_4state = digitalRead(P2_4);
    pin2_5state = digitalRead(P2_5);
    pin2_6state = digitalRead(P2_6);
    pin2_7state = digitalRead(P2_7);

    if (pin1_6state > flag1_6)
      {
          Serial.write("A");
          flag1_6 = 1;
      }
    else if (pin1_6state < flag1_6)
      {
          Serial.write("|");
          flag1_6 = 0;
      }
    /*
    if (pin1_4state > flag1_4)
      {
          Serial.write("B");
          flag1_4 = 1;
      }
    else if(pin1_4state < flag1_4)
      {
          Serial.write("|");
          flag1_4 = 0;
      }
      
    if (pin1_5state > flag1_5)
     {
         Serial.write("C");
         flag1_5 = 1;
     }
    else if (pin1_5state < flag1_5)
     {
         Serial.write("|");
         flag1_5 = 0;
     }
    if (pin1_7state > flag1_7)
     {
         Serial.write("D");
         flag1_7 = 1;
     }
    else if (pin1_7state < flag1_7)
     {
         Serial.write("|");
         flag1_7 = 0;
     }
    if (pin2_0state > flag2_0)
     {
         Serial.write("E");
         flag2_0 = 1;
     }
    else if (pin2_0state < flag2_0)
     {
         Serial.write("|");
         flag2_0 = 0;
     }
    if (pin2_1state > flag2_1)
     {
         Serial.write("F");
         flag2_1 = 1;
     }
    else if (pin2_1state < flag2_1)
     {
         Serial.write("|");
         flag2_1 = 0;
     }
    if (pin1_0state > flag1_0)
     {
         Serial.write("G");
         flag1_0 = 1;
     }
    else if (pin1_0state < flag1_0)
     {
         Serial.write("|");
         flag1_0 = 0;
     }
    if (pin1_3state > flag1_3)
     {
         Serial.write("H");
         flag1_3 = 1;
     }
    else if (pin1_3state < flag1_3)
     {
         Serial.write("|");
         flag1_3 = 0;
     }
    if (pin2_4state > flag2_4)
     {
         Serial.write("I");
         flag2_4 = 1;
     }
    else if (pin2_4state < flag2_4)
     {
         Serial.write("|");
         flag2_4 = 0;
     }
    if (pin2_5state> flag2_5)
     {
         Serial.write("J");
         flag2_5 = 1;
     }
    else if (pin2_5state < flag2_5)
     {
         Serial.write("|");
         flag2_5 = 0;
     }
    if (pin2_6state> flag2_6)
     {
         Serial.write("K");
         flag2_6 = 1;
     }
    else if (pin2_6state < flag2_6)
     {
         Serial.write("|");
         flag2_6 = 0;
     }
    if (pin2_7state > flag2_7)
     {
         Serial.write("L");
         flag2_7 = 1;
     }
    else if (pin2_7state < flag2_7)
     {
         Serial.write("|");
         flag2_7 = 0;
     }
      delay (10);    
} */
