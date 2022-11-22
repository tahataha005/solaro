#include "system.live.h"

//Setup live system data reading
void liveSystem(uint8_t consumptionPin, uint8_t chargingPin, const char* id,bool save){

    //Initialize variables
    WiFiClient wifiClient;
    HTTPClient http;
    StaticJsonDocument<256> doc;
    const char* data = "{}";
    String result;

    //Initializing JSON object
    DeserializationError err = deserializeJson(doc,data);

    //Check if JSON object is created
    if (err){
        Serial.println(err.c_str());
    }
}
