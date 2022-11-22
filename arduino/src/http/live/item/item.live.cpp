#include "item.live.h"

//Setup live item data reading
void liveItem(u_int8_t pin, const char* id,double idealConsumption, bool save) {

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
    
    //Reading consumption data
    double consumption = digitalRead(pin);
    doc["item_id"] = id;
    doc["consumption"] = consumption;

    
}