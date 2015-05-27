//
//  AppFreeTableViewCell.m
//  iAppFree
//
//  Created by Kyon on 15/5/22.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import "AppFreeTableViewCell.h"
#import "Application.h"
#import "UIImageView+WebCache.h"

@interface AppFreeTableViewCell ()

@property (retain, nonatomic) IBOutlet UIImageView *icon;
@property (retain, nonatomic) IBOutlet UILabel *name;
@property (retain, nonatomic) IBOutlet UILabel *currentPrice;
@property (retain, nonatomic) IBOutlet UIView *starCurrent;
@property (retain, nonatomic) IBOutlet UILabel *shares;
@property (retain, nonatomic) IBOutlet UILabel *score;
@property (retain, nonatomic) IBOutlet UILabel *categoryName;
@property (retain, nonatomic) IBOutlet UILabel *favorites;
@property (retain, nonatomic) IBOutlet UILabel *downloads;

@end

@implementation AppFreeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)dealloc {
    [_icon release];
    [_name release];
    [_currentPrice release];
    [_starCurrent release];
    [_shares release];
    [_score release];
    [_categoryName release];
    [_favorites release];
    [_downloads release];
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
    
    [_currentPrice setText:[NSString stringWithFormat:@"¥%@", app.currentPrice]];
    
    [Help addStarOnView:_starCurrent starCount:app.starCurrent];
    
    [_shares setText:[NSString stringWithFormat:@"分享：%@次", app.shares]];
    
    [_score setText:[NSString stringWithFormat:@"评分：%@分", app.starCurrent]];
    
    [_categoryName setText:[Help translate:app.categoryName]];
    
    [_favorites setText:[NSString stringWithFormat:@"收藏：%@次", app.favorites]];
    
    [_downloads setText:[NSString stringWithFormat:@"下载：%@次", app.downloads]];
}

@end
