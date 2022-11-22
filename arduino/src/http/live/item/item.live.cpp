#include "item.live.h"

//Setup live item data reading
void liveItem(u_int8_t pin, const char* id,double idealConsumption, bool save) {

    //Initialize variables
    WiFiClient wifiClient;
    HTTPClient http;
    StaticJsonDocument<256> doc;
    const char* data = "{}";
    String result;

}