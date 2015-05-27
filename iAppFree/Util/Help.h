//
//  Help.h
//  爱限免
//
//  Created by Kyon on 15/5/21.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Help : NSObject

+ (void)addStarOnView:(UIView *)view starCount:(NSString *)starCount;
+ (NSString *)intervalSinceNow:(NSString *)theDate;
+ (NSString *)translate:(NSString *)aStr;

@end
