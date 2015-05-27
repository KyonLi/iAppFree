//
//  AppFreeViewController.m
//  爱限免
//
//  Created by Kyon on 15/5/15.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import "AppFreeViewController.h"
#import "Application.h"
#import "AppFreeTableViewCell.h"

@interface AppFreeViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_applications;
    UITableView *_tableView;
    NSInteger _page;
}
@end

@implementation AppFreeViewController

- (void)dealloc {
    [_applications release];
    [_tableView release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [[self navigationItem] setTitle:@"免费"];
    
    [SVProgressHUD show];
    
    _applications = [NSMutableArray new];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVGATION_ADD_STATUSBAR_HEIGHT-TABBAR_HEIGHT) style:UITableViewStylePlain];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [[self view] addSubview:_tableView];
    UINib *nib = [UINib nibWithNibName:@"AppFreeTableViewCell" bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:@"AppFreeCell"];
    
    // 去除多余的分割线
    [_tableView setTableFooterView:[[[UIView alloc] init] autorelease]];
    
    // 添加上拉加载
    [_tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(continueLoadData)];
    [[_tableView footer] setHidden:YES];
    [[_tableView footer] beginRefreshing];
    
    // 添加下拉刷新
    [_tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
}

- (void)continueLoadData {
    // 下载数据
    [DownloadData getAppFreeDataWithBlock:^(NSArray *data, NSError *error) {
        [_applications addObjectsFromArray:data];
        [_tableView reloadData];
        if (_page == 1) {
            [SVProgressHUD dismiss];
            [[_tableView footer] setHidden:NO];
        }
        [[_tableView footer] endRefreshing];
    } andPage:++_page];
}

- (void)refreshData {
    [_applications removeAllObjects];
    _page = 1;
    [DownloadData getAppFreeDataWithBlock:^(NSArray *data, NSError *error) {
        [_applications addObjectsFromArray:data];
        [_tableView reloadData];
        [[_tableView header] endRefreshing];
    } andPage:_page];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _applications.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AppFreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppFreeCell"];
    [cell refreshCell:_applications[indexPath.row] andIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= (_page-1)*10) {
        // 1. 配置CATransform3D的内容
        CATransform3D transform;
        // CATransform3DMakeRotation函数创建了一个转变，将在三维轴坐标系以任意弧度旋转层
        transform = CATransform3DMakeRotation( M_PI_4, 0, 1, 0.2);
        
        // 2. 定义cell的初始状态
        cell.alpha = 0;
        cell.layer.transform = transform;
        cell.layer.anchorPoint = CGPointMake(0, 0.5);
        
        // 3. 定义cell的最终状态，并提交动画
        [UIView beginAnimations:@"transform" context:NULL];
        [UIView setAnimationDuration:0.5];
        cell.layer.transform = CATransform3DIdentity;
        cell.alpha = 1;
        cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
        [UIView commitAnimations];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
