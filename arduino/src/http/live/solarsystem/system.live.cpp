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
    
    //Reading consumption and charging data
    double consumption = digitalRead(consumptionPin);
    double charging = digitalRead(chargingPin);
    doc["system_id"] = id;
    doc["consumption"] = consumption;
    doc["charging"] = charging;

    //Creating JSON string
    serializeJson(doc,result);
    Serial.println(result);

    //Check if data should be saved
    if (save) {
        http.begin(wifiClient,"http://192.168.43.70:8000/arduino/solar/save");
    } else {
        http.begin(wifiClient,"http://192.168.43.70:8000/arduino/solar");
    };

    //Setting headers
    http.addHeader("Content-Type","application/json");
    http.addHeader("pass", "sOlArO101");

    //Sending data
    int httpResponseCode = http.POST(result);
    
    //Catching response
    String response = http.getString();

    //Displaying response
    Serial.println(httpResponseCode);
    Serial.println(response);
}
