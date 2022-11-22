#include <Arduino.h>
#include "./wifi/wifi.h"


//Main Setup function (Executed once)
void setup() {
  //Begin Serial
  Serial.begin(115200);

  //Connect to wifi
  setupWifi();

}

//Main Loop function (Executed in a loop)
void loop() {

}