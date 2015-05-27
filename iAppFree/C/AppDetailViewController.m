//
//  AppDetailViewController.m
//  iAppFree
//
//  Created by Kyon on 15/5/26.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import "AppDetailViewController.h"
#import "Application.h"
#import "UIImageView+WebCache.h"

@interface AppDetailViewController ()
{
    Application *_app;
    NSArray *_recommendApps;
}
@property (retain, nonatomic) IBOutlet UIImageView *appIcon;
@property (retain, nonatomic) IBOutlet UILabel *appName;
@property (retain, nonatomic) IBOutlet UILabel *appInfo;
@property (retain, nonatomic) IBOutlet UILabel *appDescription;
@property (retain, nonatomic) IBOutlet UIScrollView *screenshot;
@property (retain, nonatomic) IBOutlet UIScrollView *recommendScrollView;

@end

@implementation AppDetailViewController

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
        [self refreshAppDesc];
    } andAppId:_applicationId];
    
    [DownloadData getPeripheryDataWithBlock:^(NSArray *data, NSError *error) {
        _recommendApps = [data retain];
        [self refreshRecommendApps];
    } andLongitude:@"116.344539" andLatitude:@"40.034346"];
}

- (void)refreshAppDesc {
    [_appIcon sd_setImageWithURL:[NSURL URLWithString:_app.iconUrl] placeholderImage:[UIImage imageNamed:@"appproduct_appdefault"]];
    [_appName setText:_app.name];
    [_appInfo setText:[NSString stringWithFormat:@"原价:¥%@ %@ %@MB\n类型:%@  评分:%@", _app.lastPrice, [Help translate:_app.priceTrend], _app.fileSize, [Help translate:_app.categoryName], _app.starOverall]];
    [_appDescription setText:_app.appDescription];
    
    CGFloat beiShu = _screenshot.frame.size.height / 53;
    NSArray *photos = _app.photos;
    for (NSInteger i = 0; i < photos.count; i++) {
        NSDictionary *dic = photos[i];
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:dic[@"smallUrl"]] placeholderImage:[UIImage imageNamed:@"appproduct_appdefault"]];
        [imageView setFrame:CGRectMake(i* 94 * beiShu, 0, 94 * beiShu, _screenshot.frame.size.height)];
        [_screenshot addSubview:imageView];
        [imageView release];
    }
    [_screenshot setContentSize:CGSizeMake(photos.count * 94 *beiShu, _screenshot.frame.size.height)];
}

- (void)refreshRecommendApps {
    CGFloat viewHeight = _recommendScrollView.frame.size.height;
    CGFloat viewWidth = _recommendScrollView.frame.size.height - 12;
    for (NSInteger i = 0; i < _recommendApps.count; i++) {
        Application *app = _recommendApps[i];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i * viewWidth, 0, viewWidth, viewHeight)];
        UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, viewWidth - 10, viewWidth - 10)];
        [iconImageView sd_setImageWithURL:[NSURL URLWithString:app.iconUrl] placeholderImage:[UIImage imageNamed:@"appproduct_appdefault"]];
        [view addSubview:iconImageView];
        [iconImageView release];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, viewWidth, viewWidth, 12)];
        [label setText:app.name];
        [label setFont:[UIFont systemFontOfSize:11]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [view addSubview:label];
        [label release];
        
        [_recommendScrollView addSubview:view];
        [view release];
    }
    [_recommendScrollView setContentSize:CGSizeMake(viewWidth * _recommendApps.count, _recommendScrollView.frame.size.height)];
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
    [_recommendApps release];
    [_appIcon release];
    [_appName release];
    [_appInfo release];
    [_appDescription release];
    [_screenshot release];
    [_recommendScrollView release];
    [super dealloc];
}
@end
