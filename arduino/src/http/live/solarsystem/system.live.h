#ifndef __SOLAR_LIVE_H__
#define __SOLAR_LIVE_H__

#include <ESP8266HTTPClient.h>
#include <ArduinoJson.h>

void liveSystem(uint8_t consumptionPin, uint8_t chargingPin, const char* id,bool save);

#endif