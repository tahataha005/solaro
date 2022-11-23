#include "control.h"

void controlItem(uint8_t pin, const char* userId, const char* systemId, const char* itemId) {
    //Initialising variables
    HTTPClient http;
    StaticJsonDocument<200> doc;
    
    //Setting body for request
    doc["user_id"] = userId;
    doc["system_id"] = systemId;
    doc["item_id"] = itemId;

    String json;
    serializeJson(doc, json);

    //Sending request
    http.begin("http://192.168.43.70:8000/arduino/read");
    http.addHeader("Content-Type", "application/json");
    http.POST(json);


}

