#include <Arduino.h>
#include "./wifi/wifi.h"
#include "./http/live/item/item.live.h"

//Setting itital settings
const char* itemId = "6373547b22e7818efe58ac6d";
double idealConsumption = 2;
int counter = 0;

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


  if (counter == 10) {
    counter = 0;

    //Saving item and system statistics to database every 1 second
    liveItem(D0,itemId,idealConsumption,true);
 
  }
  
  counter++;
}