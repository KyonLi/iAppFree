//
//  DownloadData.m
//  爱限免
//
//  Created by Kyon on 15/5/22.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import "DownloadData.h"
#import "AFAppDotNetAPIClient.h"
#import "Application.h"
#import "Subject.h"

@implementation DownloadData

+ (NSURLSessionDataTask *)getLimitFreeDataWithBlock:(void (^)(NSArray *data, NSError *error))block {
    return [[AFAppDotNetAPIClient sharedClient] GET:@"free/applications/limited?currency=rmb" parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *JSON) {
        NSMutableArray *mutableArray = [NSMutableArray array];
        NSArray *apps = JSON[@"applications"];
        for (NSDictionary *dic in apps) {
            Application *app = [[Application alloc] initWithDic:dic];
            [mutableArray addObject:app];
            [app release];
        }
        if (block) {
            block([NSArray arrayWithArray:mutableArray], nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            block([NSArray array], error);
        }
    }];
}

+ (NSURLSessionDataTask *)getReducePriceDataWithBlock:(void (^)(NSArray *, NSError *))block {
    return [[AFAppDotNetAPIClient sharedClient] GET:@"free/applications/sales?currency=rmb" parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *JSON) {
        NSMutableArray *mutableArray = [NSMutableArray array];
        NSArray *apps = JSON[@"applications"];
        for (NSDictionary *dic in apps) {
            Application *app = [[Application alloc] initWithDic:dic];
            [mutableArray addObject:app];
            [app release];
        }
        if (block) {
            block([NSArray arrayWithArray:mutableArray], nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            block([NSArray array], error);
        }
    }];
}

+ (NSURLSessionDataTask *)getSubjectDataWithBlock:(void (^)(NSArray *, NSError *))block {
    return [[AFAppDotNetAPIClient sharedClient] GET:@"free/special?page=1&limit=5" parameters:nil success:^(NSURLSessionDataTask *task, NSArray *JSON) {
        NSMutableArray *mutableArray = [NSMutableArray array];
        for (NSDictionary *dic in JSON) {
            Subject *subject = [[Subject alloc] initWithSubjectData:dic];
            [mutableArray addObject:subject];
            [subject release];
        }
        if (block) {
            block([NSArray arrayWithArray:mutableArray], nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            block([NSArray array], error);
        }
    }];
}

@end