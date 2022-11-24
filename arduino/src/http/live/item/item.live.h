#ifndef __ITEM_LIVE_H__
#define __ITEM_LIVE_H__

#include <ESP8266HTTPClient.h>
#include <ArduinoJson.h>

void liveItem(uint8_t pin, const char* id, double idealConsumption,bool save);

#endif