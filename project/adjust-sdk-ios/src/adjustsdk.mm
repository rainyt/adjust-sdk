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
