//
//  LimitFreeTableViewCell.m
//  爱限免
//
//  Created by Kyon on 15/5/15.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import "LimitFreeTableViewCell.h"
#import "Application.h"
#import "LPLabel.h"
#import "UIImageView+WebCache.h"

@interface LimitFreeTableViewCell ()

@property (retain, nonatomic) IBOutlet UIImageView *icon;
@property (retain, nonatomic) IBOutlet UILabel *name;
@property (retain, nonatomic) IBOutlet UILabel *timeLimit;
@property (retain, nonatomic) IBOutlet UIView *starCurrent;
@property (retain, nonatomic) IBOutlet UILabel *shares;
@property (retain, nonatomic) IBOutlet LPLabel *lastPrice;
@property (retain, nonatomic) IBOutlet UILabel *categoryName;
@property (retain, nonatomic) IBOutlet UILabel *favorites;
@property (retain, nonatomic) IBOutlet UILabel *downloads;
@property (retain, nonatomic) NSString *expireDatetime;

@end

@implementation LimitFreeTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(refreshTimeLimitLabel:) userInfo:nil repeats:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_icon release];
    [_name release];
    [_timeLimit release];
    [_starCurrent release];
    [_shares release];
    [_lastPrice release];
    [_categoryName release];
    [_favorites release];
    [_downloads release];
    [_expireDatetime release];
    [super dealloc];
}

- (void)refreshCell:(Application *)app andIndex:(NSInteger)index {
    if (index % 2 == 0) {
        [self setBackgroundColor:[UIColor colorWithRed:0.863 green:0.894 blue:0.882 alpha:1.000]];
    }
    else {
        [self setBackgroundColor:[UIColor colorWithWhite:0.965 alpha:1.000]];
    }
    
    NSURL *iconUrl = [NSURL URLWithString:app.iconUrl];
    [_icon sd_setImageWithURL:iconUrl placeholderImage:[UIImage imageNamed:@"appproduct_appdefault"]];
    
    [_name setText:[NSString stringWithFormat:@"%ld.%@", index + 1, app.name]];
    
    [self setExpireDatetime:app.expireDatetime];
    
    [Help addStarOnView:_starCurrent starCount:app.starCurrent];
    
    [_shares setText:[NSString stringWithFormat:@"分享：%@次", app.shares]];
    
    [_lastPrice setText:[NSString stringWithFormat:@"¥%@", app.lastPrice]];
    [_lastPrice setStrikeThroughEnabled:YES];
    [_lastPrice setStrikeThroughColor:[UIColor colorWithWhite:0.494 alpha:1.000]];
    
    [_categoryName setText:[Help translate:app.categoryName]];
    
    [_favorites setText:[NSString stringWithFormat:@"收藏：%@次", app.favorites]];
    
    [_downloads setText:[NSString stringWithFormat:@"下载：%@次", app.downloads]];
}

- (void)refreshTimeLimitLabel:(NSTimer *)sender {
    [_timeLimit setText:[Help intervalSinceNow:_expireDatetime]];
}

@end
