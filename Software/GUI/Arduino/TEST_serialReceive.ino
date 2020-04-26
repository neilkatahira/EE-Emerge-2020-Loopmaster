int received = 0;

void setup() {
  Serial.begin(115200); 
}

void loop() {
  if (Serial.available() > 0) {
    received = Serial.read();
    Serial.print("Read: ");
    Serial.println(received, DEC);
  }
}
