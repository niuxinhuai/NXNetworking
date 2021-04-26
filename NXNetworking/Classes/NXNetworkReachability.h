//
//  NXNetworkReachability.h
//  ATest
//
//  Created by 牛新怀 on 2021/4/26.
//  Copyright © 2021 牛新怀. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef NS_ENUM(NSInteger, NXNetworkReachabilityStatus) {
    NXNetworkReachabilityStatusUnknown          = -1,
    NXNetworkReachabilityStatusNotReachable     = 0,
    NXNetworkReachabilityStatusReachableViaWiFi = 1,
    NXNetworkReachabilityStatusReachableVia2G = 2,
    NXNetworkReachabilityStatusReachableVia3G = 3,
    NXNetworkReachabilityStatusReachableVia4G = 4,
};

NS_ASSUME_NONNULL_BEGIN

@interface NXNetworkReachability : NSObject

//网络改变监测：
+(void)reachabilityChangeMonitoring:(void(^)(AFNetworkReachabilityStatus status))changeBlock;

//判断当前是否联网：
+(BOOL)isReachableNetwork;

+(BOOL)isReachableViaWiFi;

/**
 *网络状态不包含2g，3g，4g
 */
+(AFNetworkReachabilityStatus)networkReachabilityStatus;

/**
 *获取详细的当前网络信息wifi，2g，3g，4g
 */
+(NXNetworkReachabilityStatus)networkReachabilityStatus_detail;

@end

NS_ASSUME_NONNULL_END
