#include <Arduino.h>
#include "./wifi/wifi.h"
#include "./http/live/item/item.live.h"
#include "./http/live/solarsystem/system.live.h"
#include "./http/control/control.h"

//Setting initial settings
const char* userId = "63669e05e464e3fb910146c8";
int counter = 0;

const char* systemId = "6366a047cb1d6bcd80ef72f4";

const char* itemId = "6366a207bab84acdd79f23a5";
double idealConsumption = 2;

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

  //Loop delay
  delay(100);

  //Reading item and system statistics and display on screen
  liveItem(D0,itemId,idealConsumption,false);
  liveSystem(D0,D1,systemId,false);
  controlItem(D0,userId,systemId,itemId);

  if (counter == 10) {
    counter = 0;

    //Saving item and system statistics to database every 1 second
    liveItem(D0,itemId,idealConsumption,true);
    liveSystem(D0,D1,systemId,true);
  }
  
  counter++;
}