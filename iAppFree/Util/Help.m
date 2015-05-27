//
//  Help.m
//  爱限免
//
//  Created by Kyon on 15/5/21.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import "Help.h"

@implementation Help

+ (void)addStarOnView:(UIView *)view starCount:(NSString *)starCount {
    UIImage *halfStar = [UIImage imageNamed:@"appproduct_starforeground_half_Topic"];
    UIImage *fullStar = [UIImage imageNamed:@"appproduct_starforeground_Topic"];
    UIImage *emptyStar = [UIImage imageNamed:@"appproduct_starbackground_Topic"];
    NSArray *countArr = [starCount componentsSeparatedByString:@"."];
    
    CGFloat beiShu = view.frame.size.height / fullStar.size.height;
    CGFloat starImageViewWidth = fullStar.size.width * beiShu;
    
    NSInteger fullCount = [countArr[0] integerValue];
    NSInteger halfCount = [countArr[1] integerValue];
    if (halfCount == 5) {
        halfCount = 1;
    }
    
    for (UIView *subView in view.subviews) {
        [subView removeFromSuperview];
    }
    
    for (NSInteger i = 0; i < 5; i++) {
        if (i < fullCount) {
            UIImageView *fullStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * starImageViewWidth, 0, starImageViewWidth, view.frame.size.height)];
            [fullStarImageView setImage:fullStar];
            [view addSubview:fullStarImageView];
            [fullStarImageView release];
        }
        else if (i < fullCount + halfCount) {
            UIImageView *halfStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * starImageViewWidth, 0, starImageViewWidth, view.frame.size.height)];
            [halfStarImageView setImage:halfStar];
            [view addSubview:halfStarImageView];
            [halfStarImageView release];
        }
        else {
            UIImageView *emptyStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * starImageViewWidth, 0, starImageViewWidth, view.frame.size.height)];
            [emptyStarImageView setImage:emptyStar];
            [view addSubview:emptyStarImageView];
            [emptyStarImageView release];
        }
    }
}

+ (NSString *)intervalSinceNow:(NSString *)theDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.0"];
    NSDate *date = [formatter dateFromString:theDate];
    [formatter release];
    NSTimeInterval timeInterval = [date timeIntervalSinceNow];
    NSInteger hour = timeInterval/3600;
    NSInteger minutes = (NSInteger)timeInterval%3600/60;
    NSInteger seconds = (NSInteger)timeInterval%3600%60;
    return [NSString stringWithFormat:@"剩余 %ld:%ld:%ld", hour, minutes, seconds];
}

+ (NSString *)translate:(NSString *)aStr {
    NSDictionary *dic = @{@"Game":@"游戏", @"Health":@"健康", @"Education":@"教育", @"Social":@"社交", @"Book":@"书籍", @"Pastime":@"娱乐", @"limited":@"限免中", @"sales":@"降价中", @"free":@"免费中", @"Tool":@"工具", @"Photography":@"摄影"};
    return dic[aStr];
}

@end
