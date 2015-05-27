//
//  LimitFreeDetailViewController.m
//  iAppFree
//
//  Created by Kyon on 15/5/26.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import "LimitFreeDetailViewController.h"
#import "Application.h"
#import "UIImageView+WebCache.h"

@interface LimitFreeDetailViewController ()
{
    Application *_app;
}
@property (retain, nonatomic) IBOutlet UIImageView *appIcon;
@property (retain, nonatomic) IBOutlet UILabel *appName;
@property (retain, nonatomic) IBOutlet UILabel *appInfo;
@property (retain, nonatomic) IBOutlet UILabel *appDescription;

@end

@implementation LimitFreeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[self navigationItem] setTitle:@"应用详情"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 63, 30)];
    [button setTitle:@" 返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_back"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    [[self navigationItem] setLeftBarButtonItem:leftButton animated:YES];
    [leftButton release];
    
    [DownloadData getDetailDataWithBlock:^(Application *data, NSError *error) {
        _app = [data retain];
        [self refresh];
    } andAppId:_applicationId];
}

- (void)refresh {
    [_appIcon sd_setImageWithURL:[NSURL URLWithString:_app.iconUrl] placeholderImage:[UIImage imageNamed:@"appproduct_appdefault"]];
    [_appName setText:_app.name];
    [_appInfo setText:[NSString stringWithFormat:@"原价:¥%@ 限免中 %@MB\n类型：%@ 评分：%@", _app.lastPrice, _app.fileSize, _app.categoryName, _app.starOverall]];
    [_appDescription setText:_app.appDescription];
}

- (void)buttonClicked:(UIButton *)sender {
    [[self navigationController] popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_applicationId release];
    [_app release];
    [_appIcon release];
    [_appName release];
    [_appInfo release];
    [_appDescription release];
    [super dealloc];
}
@end
