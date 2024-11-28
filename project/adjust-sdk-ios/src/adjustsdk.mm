#include "adjustsdk.hpp"
#import <Foundation/Foundation.h>
#import <AdjustSdk/AdjustSdk.h>

/**
 初始化adjust-sdk，需要提供`token`以及`debug`模式
 @param token adjust_token
 @param debug 是否启动调试模式
 */
void initByToken(const char* token, bool debug) {
    NSString *appToken = [NSString stringWithUTF8String:token];
    NSString *environment = debug ? ADJEnvironmentSandbox : ADJEnvironmentProduction;
    ADJConfig *adjustConfig = [[ADJConfig alloc] initWithAppToken:appToken
                                                environment:environment
                                                suppressLogLevel:YES];
    [adjustConfig setLogLevel:ADJLogLevelVerbose];
    [Adjust initSdk:adjustConfig];
}

/**
 上报事件
 @param eventToken 提供事件参数
 */
void trackAdjustEvent(const char* eventToken) {
    NSString *eventTokenString = [NSString stringWithUTF8String:eventToken];
    ADJEvent *event = [[ADJEvent alloc] initWithEventToken:eventTokenString];
    [Adjust trackEvent:event];
}

/**
 上报付费记录
 @param key 事件参数
 @param revenue 价格，单位：分
 @param currency 货币代号
 */
void trackAdjustRevenue(const char* key, int revenue, const char* currency) {
    NSString *keyString = [NSString stringWithUTF8String:key];
    NSString *currencyString = [NSString stringWithUTF8String:currency];
    ADJEvent *event = [[ADJEvent alloc] initWithEventToken: keyString];
    [event setRevenue:0.01 currency: currencyString];
    [Adjust trackEvent:event];
}
