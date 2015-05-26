//
//  Application.h
//  爱限免
//
//  Created by Kyon on 15/5/15.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Application : NSObject
@property (nonatomic, retain) NSString *applicationId;
@property (nonatomic, retain) NSString *appurl;
@property (nonatomic, retain) NSString *categoryId;
@property (nonatomic, retain) NSString *categoryName;
@property (nonatomic, retain) NSString *currentVersion;
@property (nonatomic, retain) NSString *currentPrice;
@property (nonatomic, retain) NSString *appDescription;
@property (nonatomic, retain) NSString *description_long;
@property (nonatomic, retain) NSString *downloads;
@property (nonatomic, retain) NSString *expireDatetime;
@property (nonatomic, retain) NSString *favorites;
@property (nonatomic, retain) NSString *fileSize;
@property (nonatomic, retain) NSString *iconUrl;
@property (nonatomic, retain) NSString *ipa;
@property (nonatomic, retain) NSString *itunesUrl;
@property (nonatomic, retain) NSString *language;
@property (nonatomic, retain) NSString *lastPrice;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *newversion;
@property (nonatomic, retain) NSString *priceTrend;
@property (nonatomic, retain) NSString *ratingOverall;
@property (nonatomic, retain) NSString *releaseDate;
@property (nonatomic, retain) NSString *releaseNotes;
@property (nonatomic, retain) NSString *shares;
@property (nonatomic, retain) NSString *slug;
@property (nonatomic, retain) NSString *starCurrent;
@property (nonatomic, retain) NSString *starOverall;
@property (nonatomic, retain) NSString *systemRequirements;
@property (nonatomic, retain) NSString *sellerId;
@property (nonatomic, retain) NSString *sellerName;
@property (nonatomic, retain) NSString *updateDate;
@property (nonatomic, retain) NSString *version;
@property (nonatomic, retain) NSString *comment;
@property (nonatomic, retain) NSArray *photos;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
