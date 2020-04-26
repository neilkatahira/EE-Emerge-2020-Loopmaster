int value;

void setup() {
  Serial.begin(115200);
}

void loop() {
  if(Serial.available()>0) {
    String value=Serial.readString();
    value.trim(); // trim new line character
    if (value != '\n' || value != '\r') {
      if (isdigit(atoi(value.c_str()))) 
        Serial.write(atoi(value.c_str()));
      else
        Serial.write(value.c_str());
    }
  }
}
