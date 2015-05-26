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

+ (NSURLSessionDataTask *)getLimitFreeDataWithBlock:(void (^)(NSArray *data, NSError *error))block andPage:(NSInteger)page {
    return [[AFAppDotNetAPIClient sharedClient] GET:[NSString stringWithFormat:@"free/applications/limited?currency=rmb&page=%ld", page] parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *JSON) {
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


+ (NSURLSessionDataTask *)getReducePriceDataWithBlock:(void (^)(NSArray *data, NSError *error))block andPage:(NSInteger)page {
    return [[AFAppDotNetAPIClient sharedClient] GET:[NSString stringWithFormat:@"free/applications/sales?currency=rmb&page=%ld", page] parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *JSON) {
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

+ (NSURLSessionDataTask *)getAppFreeDataWithBlock:(void (^)(NSArray *data, NSError *error))block andPage:(NSInteger)page {
    return [[AFAppDotNetAPIClient sharedClient] GET:[NSString stringWithFormat:@"free/applications/free?currency=rmb&page=%ld", page] parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *JSON) {
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

+ (NSURLSessionDataTask *)getSubjectDataWithBlock:(void (^)(NSArray *data, NSError *error))block andPage:(NSInteger)page {
    return [[AFAppDotNetAPIClient sharedClient] GET:[NSString stringWithFormat:@"free/special?page=%ld&limit=5", page] parameters:nil success:^(NSURLSessionDataTask *task, NSArray *JSON) {
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

+ (NSURLSessionDataTask *)getDetailDataWithBlock:(void (^)(Application *data, NSError *error))block andAppId:(NSString *)appId {
    return [[AFAppDotNetAPIClient sharedClient] GET:[NSString stringWithFormat:@"free/applications/%@?currency=rmb", appId] parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *JSON) {
        Application *app = [[Application alloc] initWithDic:JSON];
        if (block) {
            block([app autorelease], nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            block([[[Application alloc] init] autorelease], error);
        }
    }];
}

@end
