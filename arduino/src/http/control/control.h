#ifndef __CONTROL_H__
#define __CONTROL_H__

#include <ESP8266HTTPClient.h>
#include <ArduinoJson.h>

void controlItem(uint8_t pin, const char* userId, const char* systemId, const char* itemId);

#endif