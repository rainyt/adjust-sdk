#pragma once

void initByToken(const char* token, bool debug);

void trackAdjustEvent(const char* eventToken);

void trackAdjustRevenue(const char* key, int revenue, const char* currency);