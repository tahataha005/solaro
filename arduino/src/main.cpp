#include <Arduino.h>
#include "./wifi/wifi.h"


//Main Setup function (Executed once)
void setup() {
  //Begin Serial
  Serial.begin(115200);

  //Connect to wifi
  setupWifi();

  //Check if wifi is connected
  if (WiFi.status() == WL_CONNECTED) {
    Serial.println("Error in WiFi connection");
  } else {
    Serial.println("Error in WiFi connection");
  }

}

//Main Loop function (Executed in a loop)
void loop() {

}