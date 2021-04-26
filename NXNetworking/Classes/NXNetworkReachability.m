//
//  NXNetworkReachability.m
//  ATest
//
//  Created by 牛新怀 on 2021/4/26.
//  Copyright © 2021 牛新怀. All rights reserved.
//

#import "NXNetworkReachability.h"
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

@implementation NXNetworkReachability

+(void)reachabilityChangeMonitoring:(void(^)(AFNetworkReachabilityStatus status))changeBlock
{
    static AFNetworkReachabilityStatus current = -1;
//    NSURL *baseURL = [NSURL URLWithString:@"http://baidu.com/"];
//    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:nil];
//    NSOperationQueue *operationQueue = manager.operationQueue;
    AFNetworkReachabilityManager * manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
       
        changeBlock(status);
        
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
                if (current == AFNetworkReachabilityStatusReachableViaWiFi) {
//                    [[NSNotificationCenter defaultCenter] postNotificationName:kNetwork_Wifi_To_3G_NOTIFICATION object:nil];
                }
            case AFNetworkReachabilityStatusReachableViaWiFi:
                if (current == AFNetworkReachabilityStatusNotReachable) {
//                    [[NSNotificationCenter defaultCenter] postNotificationName:kNetworkBecomeActive_NOTIFICATION object:nil];
                }
//                [operationQueue setSuspended:NO];
                break;
            case AFNetworkReachabilityStatusNotReachable:
                current = AFNetworkReachabilityStatusNotReachable;
                break;
            default:
//                [operationQueue setSuspended:YES];
                break;
        }
        current = status;
    }];
    
    [manager startMonitoring];
}

+(BOOL)isReachableNetwork
{
    BOOL isReachable = [[AFNetworkReachabilityManager sharedManager] isReachable];
    return isReachable;
}


+(BOOL)isReachableViaWiFi
{
    BOOL isReachable = [[AFNetworkReachabilityManager sharedManager] isReachableViaWiFi];
    return isReachable;
}


+(AFNetworkReachabilityStatus)networkReachabilityStatus
{
    return [[AFNetworkReachabilityManager sharedManager] networkReachabilityStatus];
}

+(NXNetworkReachabilityStatus)networkReachabilityStatus_detail
{
    AFNetworkReachabilityStatus status = [self networkReachabilityStatus];
    if (status == AFNetworkReachabilityStatusNotReachable) {
        return NXNetworkReachabilityStatusNotReachable;
    }else if (status == AFNetworkReachabilityStatusUnknown) {
        return NXNetworkReachabilityStatusUnknown;
    }else if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
        return NXNetworkReachabilityStatusReachableViaWiFi;
    }else {
        CTTelephonyNetworkInfo *networkStatus = [[CTTelephonyNetworkInfo alloc] init];
        NSString *currentStatus  = networkStatus.currentRadioAccessTechnology;
      
        if ([currentStatus isEqualToString:CTRadioAccessTechnologyLTE]) {
            return NXNetworkReachabilityStatusReachableVia4G;
        } else if ([currentStatus isEqualToString:CTRadioAccessTechnologyGPRS] || [currentStatus isEqualToString:CTRadioAccessTechnologyEdge]) {
            return NXNetworkReachabilityStatusReachableVia2G;
        } else {
            return NXNetworkReachabilityStatusReachableVia3G;
        }
    }

    return NXNetworkReachabilityStatusUnknown;
}

@end
