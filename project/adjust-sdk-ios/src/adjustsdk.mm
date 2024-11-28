#include "adjustsdk.hpp"
#import <Foundation/Foundation.h>
#import <AdjustSdk/AdjustSdk.h>

void initByToken(const char* token, bool debug) {
    NSString *appToken = [NSString stringWithUTF8String:token];
    NSString *environment = debug ? ADJEnvironmentSandbox : ADJEnvironmentProduction;
    ADJConfig *adjustConfig = [[ADJConfig alloc] initWithAppToken:appToken
                                                environment:environment
                                                suppressLogLevel:YES];
    [adjustConfig setLogLevel:ADJLogLevelVerbose];
    [Adjust initSdk:adjustConfig];
}

void trackAdjustEvent(const char* eventToken) {
    NSString *eventTokenString = [NSString stringWithUTF8String:eventToken];
    ADJEvent *event = [[ADJEvent alloc] initWithEventToken:eventTokenString];
    [Adjust trackEvent:event];
}

void trackAdjustRevenue(const char* key, int revenue, const char* currency) {
    NSString *keyString = [NSString stringWithUTF8String:key];
    NSString *currencyString = [NSString stringWithUTF8String:currency];
    ADJEvent *event = [[ADJEvent alloc] initWithEventToken: keyString];
    [event setRevenue:0.01 currency: currencyString];
    [Adjust trackEvent:event];
}
