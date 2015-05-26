//
//  RankViewController.m
//  爱限免
//
//  Created by Kyon on 15/5/15.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import "RankViewController.h"

@interface RankViewController ()

@end

@implementation RankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [[self navigationItem] setTitle:@"热榜"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
