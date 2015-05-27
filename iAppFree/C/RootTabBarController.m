//
//  RootTabBarController.m
//  爱限免
//
//  Created by Kyon on 15/5/15.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import "RootTabBarController.h"
#import "LimitFreeViewController.h"
#import "ReducePriceViewController.h"
#import "AppFreeViewController.h"
#import "SubjectViewController.h"
#import "RankViewController.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
#pragma mark --限免
    LimitFreeViewController *limitFreeVC = [[LimitFreeViewController alloc] init];
    UINavigationController *limitFreeNav = [[UINavigationController alloc] initWithRootViewController:limitFreeVC];
    [limitFreeVC release];
    [[limitFreeNav tabBarItem] setTitle:@"限免"];
    [[limitFreeNav tabBarItem] setImage:[UIImage imageNamed:@"tabbar_limitfree"]];
    [[limitFreeNav tabBarItem] setSelectedImage:[UIImage imageNamed:@"tabbar_limitfree_press"]];
    
#pragma mark --降价
    ReducePriceViewController *reducePriceVC = [[ReducePriceViewController alloc] init];
    UINavigationController *reducePriceNav = [[UINavigationController alloc] initWithRootViewController:reducePriceVC];
    [reducePriceVC release];
    [[reducePriceNav tabBarItem] setTitle:@"降价"];
    [[reducePriceNav tabBarItem] setImage:[UIImage imageNamed:@"tabbar_reduceprice"]];
    [[reducePriceNav tabBarItem] setSelectedImage:[UIImage imageNamed:@"tabbar_reduceprice_press"]];
    
#pragma mark --免费
    AppFreeViewController *appFreeVC = [[AppFreeViewController alloc] init];
    UINavigationController *appFreeNav = [[UINavigationController alloc] initWithRootViewController:appFreeVC];
    [appFreeVC release];
    [[appFreeNav tabBarItem] setTitle:@"免费"];
    [[appFreeNav tabBarItem] setImage:[UIImage imageNamed:@"tabbar_appfree"]];
    [[appFreeNav tabBarItem] setSelectedImage:[UIImage imageNamed:@"tabbar_appfree_press"]];
    
#pragma mark --专题
    SubjectViewController *subjectVC = [[SubjectViewController alloc] init];
    UINavigationController *subjectNav = [[UINavigationController alloc] initWithRootViewController:subjectVC];
    [subjectVC release];
    [[subjectNav tabBarItem] setTitle:@"专题"];
    [[subjectNav tabBarItem] setImage:[UIImage imageNamed:@"tabbar_subject"]];
    [[subjectNav tabBarItem] setSelectedImage:[UIImage imageNamed:@"tabbar_subject_press"]];
    
#pragma mark --热榜
    RankViewController *rankVC = [[RankViewController alloc] init];
    UINavigationController *rankNav = [[UINavigationController alloc] initWithRootViewController:rankVC];
    [rankVC release];
    [[rankNav tabBarItem] setTitle:@"热榜"];
    [[rankNav tabBarItem] setImage:[UIImage imageNamed:@"tabbar_rank"]];
    [[rankNav tabBarItem] setSelectedImage:[UIImage imageNamed:@"tabbar_rank_press"]];
    
    
    [self setViewControllers:@[limitFreeNav, reducePriceNav, appFreeNav, subjectNav, rankNav]];
    [limitFreeNav release];
    [reducePriceNav release];
    [appFreeNav release];
    [subjectNav release];
    [rankNav release];
    
    UIImage *navBgImage = [UIImage imageNamed:@"navigationbar"];
    [[UINavigationBar appearance] setBackgroundImage:[self resizeImage:navBgImage rect:CGRectMake(0, 0, SCREEN_WIDTH, navBgImage.size.height)] forBarMetrics:UIBarMetricsDefault];
    UIImage *tabBar = [UIImage imageNamed:@"tabbar_bg"];
    [[UITabBar appearance] setBackgroundImage:[self resizeImage:tabBar rect:CGRectMake(0, 0, SCREEN_WIDTH, tabBar.size.height)]];
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tabBar_Slider"]];
}

//UIImage大小变更
- (UIImage*)resizeImage:(UIImage *)img rect:(CGRect)rect{
    UIGraphicsBeginImageContext(rect.size);
    [img drawInRect:rect];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resizedImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
