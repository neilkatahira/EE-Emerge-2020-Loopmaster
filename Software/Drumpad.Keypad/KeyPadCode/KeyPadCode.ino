
int flag1_6 = 0,
flag1_4 = 0,
flag1_5 = 0,
flag1_7 = 0,
flag2_0 = 0,
flag2_2 = 0,
flag2_3 = 0,
flag2_4 = 0,
flag2_5 = 0,
flag2_6 = 0,
flag2_7 = 0;
void setup()
{ 
  Serial.begin(9600);
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
  
  // sets the digital pin as input
}
void loop()
{
    if (digitalRead(P1_6) > flag1_6)
      {
          Serial.write("0");
          flag1_6 = 1;
      }
    if (digitalRead(P1_6) < flag1_6)
      {
          Serial.write("|");
          flag1_6 = 0;
      }
    if (digitalRead(P1_4) > flag1_4)
      {
          Serial.write("1");
          flag1_4 = 1;
      }
    if (digitalRead(P1_4) < flag1_4)
      {
          Serial.write("|");
          flag1_4 = 0;
      }
    if (digitalRead(P1_5) > flag1_5)
      {
          Serial.write("2");
          flag1_5 = 1;
      }
    if (digitalRead(P1_5) < flag1_5)
      {
          Serial.write("|");
          flag1_5 = 0;
      }
    if (digitalRead(P1_7) > flag1_7)
      {
          Serial.write("3");
          flag1_7 = 1;
      }
    if (digitalRead(P1_7) < flag1_7)
      {
          Serial.write("|");
          flag1_7 = 0;
      }
    if (digitalRead(P2_0) > flag2_0)
      {
          Serial.write("4");
          flag2_0 = 1;
      }
    if (digitalRead(P2_0) < flag2_0)
      {
          Serial.write("|");
          flag2_0 = 0;
      }
    if (digitalRead(P2_1) > flag2_1)
      {
          Serial.write("5");
          flag2_1 = 1;
      }
    if (digitalRead(P2_1) < flag2_1)
      {
          Serial.write("|");
          flag2_1 = 0;
      }
    if (digitalRead(P2_2) > flag2_2)
      {
          Serial.write("6");
          flag2_2 = 1;
      }
    if (digitalRead(P2_2) < flag2_2)
      {
          Serial.write("|");
          flag2_2 = 0;
      }
    if (digitalRead(P2_3) > flag2_3)
      {
          Serial.write("7");
          flag2_3 = 1;
      }
    if (digitalRead(P2_3) < flag2_3)
      {
          Serial.write("|");
          flag2_3 = 0;
      }
    if (digitalRead(P2_4) > flag2_4)
      {
          Serial.write("8");
          flag2_4 = 1;
      }
    if (digitalRead(P2_4) < flag2_4)
      {
          Serial.write("|");
          flag2_4 = 0;
      }
    if (digitalRead(P2_5) > flag2_5)
      {
          Serial.write("9");
          flag2_5 = 1;
      }
    if (digitalRead(P2_5) < flag2_5)
      {
          Serial.write("|");
          flag2_5 = 0;
      }
}
