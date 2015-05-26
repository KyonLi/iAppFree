//
//  Application.m
//  爱限免
//
//  Created by Kyon on 15/5/15.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import "Application.h"
#import "AFAppDotNetAPIClient.h"

@implementation Application

- (void)dealloc {
    [_applicationId release];
    [_appurl release];
    [_categoryId release];
    [_categoryName release];
    [_currentVersion release];
    [_currentPrice release];
    [_appDescription release];
    [_description_long release];
    [_downloads release];
    [_expireDatetime release];
    [_favorites release];
    [_fileSize release];
    [_iconUrl release];
    [_ipa release];
    [_itunesUrl release];
    [_language release];
    [_lastPrice release];
    [_name release];
    [_newversion release];
    [_priceTrend release];
    [_ratingOverall release];
    [_releaseDate release];
    [_releaseNotes release];
    [_shares release];
    [_slug release];
    [_starCurrent release];
    [_starOverall release];
    [_systemRequirements release];
    [_sellerId release];
    [_sellerName release];
    [_updateDate release];
    [_version release];
    [_comment release];
    [_photos release];
    [super dealloc];
}

// 当字典中有key，但数据模型中没有对应的属性时会调用这个方法
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"description"]) {
        [self setAppDescription:value];
    }
}

- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}

- (instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
