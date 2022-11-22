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

    //Peak detection
    if (consumption > idealConsumption) {
        doc["peak"] = true;

        http.begin(wifiClient,"http://192.168.43.70:8000/arduino/item/save");
    } else {
        doc["peak"] = false;

        //Check if data should be saved
        if (save) {
            http.begin(wifiClient,"http://192.168.43.70:8000/arduino/item/save");
        } else {
            http.begin(wifiClient,"http://192.168.43.70:8000/arduino/item");
        }
    }

    //Creating JSON string
    serializeJson(doc,result);
    Serial.println(result);

    //Setting headers
    http.addHeader("Content-Type","application/json");
    //Sending data
    int httpResponseCode = http.POST(result);

    //Catching response
    String response = http.getString();

    //Displaying response
    Serial.println(httpResponseCode);
    Serial.println(response);
}