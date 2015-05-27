//
//  ScreenshotViewController.h
//  iAppFree
//
//  Created by Kyon on 15/5/27.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScreenshotViewController : UIViewController

@property (nonatomic, retain) NSString *imageUrl;
@property (nonatomic, retain) UIViewController *preVC;
- (instancetype)initWithImageUrl:(NSString *)imageUrl andPreVC:(UIViewController *)preVC;

@end
