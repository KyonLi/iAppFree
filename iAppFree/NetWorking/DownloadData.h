//
//  DownloadData.h
//  爱限免
//
//  Created by Kyon on 15/5/22.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Application;

@interface DownloadData : NSObject

#pragma mark --限免
+ (NSURLSessionDataTask *)getLimitFreeDataWithBlock:(void (^)(NSArray *data, NSError *error))block andPage:(NSInteger)page;
#pragma mark --降价
+ (NSURLSessionDataTask *)getReducePriceDataWithBlock:(void (^)(NSArray *data, NSError *error))block andPage:(NSInteger)page;
#pragma mark --免费
+ (NSURLSessionDataTask *)getAppFreeDataWithBlock:(void (^)(NSArray *data, NSError *error))block andPage:(NSInteger)page;
#pragma mark --专题
+ (NSURLSessionDataTask *)getSubjectDataWithBlock:(void (^)(NSArray *data, NSError *error))block andPage:(NSInteger)page;
#pragma mark --详情
+ (NSURLSessionDataTask *)getDetailDataWithBlock:(void (^)(Application *data, NSError *error))block andAppId:(NSString *)appId;

@end
