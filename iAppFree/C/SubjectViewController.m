//
//  SubjectViewController.m
//  爱限免
//
//  Created by Kyon on 15/5/15.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import "SubjectViewController.h"
#import "Subject.h"
#import "SubjectTableViewCell.h"

@interface SubjectViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_subjects;
    UITableView *_tableView;
}
@end

@implementation SubjectViewController

- (void)dealloc {
    [_subjects release];
    [_tableView release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [[self navigationItem] setTitle:@"专题"];
    
    [SVProgressHUD show];
    
    _subjects = [NSMutableArray new];
    
    // 下载数据
    [DownloadData getSubjectDataWithBlock:^(NSArray *data, NSError *error) {
        [_subjects addObjectsFromArray:data];
        [_tableView reloadData];
        [SVProgressHUD dismiss];
        [[_tableView footer] setHidden:NO];
    } andPage:1];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVGATION_ADD_STATUSBAR_HEIGHT-TABBAR_HEIGHT) style:UITableViewStylePlain];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    [[self view] addSubview:_tableView];
    UINib *nib = [UINib nibWithNibName:@"SubjectTableViewCell" bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:@"SubjectCell"];
    
    // 去除多余的分割线
    [_tableView setTableFooterView:[[[UIView alloc] init] autorelease]];
    
    // 添加上拉加载
    [_tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(continueLoadData)];
    [[_tableView footer] setHidden:YES];
}

- (void)continueLoadData {
    static NSInteger page = 2;
    [DownloadData getSubjectDataWithBlock:^(NSArray *data, NSError *error) {
        [_subjects addObjectsFromArray:data];
        [_tableView reloadData];
    } andPage:page++];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _subjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 5 == 0) {
        [[_tableView footer] setHidden:YES];
        [[_tableView footer] setHidden:NO];
    }
    SubjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubjectCell"];
    [cell refreshCell:_subjects[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 400;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    // 1. 配置CATransform3D的内容
//    CATransform3D transform;
//    // CATransform3DMakeRotation函数创建了一个转变，将在三维轴坐标系以任意弧度旋转层
//    transform = CATransform3DMakeRotation( M_PI_4, 0, 1, 0.2);
//    
//    // 2. 定义cell的初始状态
//    cell.alpha = 0;
//    cell.layer.transform = transform;
//    cell.layer.anchorPoint = CGPointMake(0, 0.5);
//    
//    // 3. 定义cell的最终状态，并提交动画
//    [UIView beginAnimations:@"transform" context:NULL];
//    [UIView setAnimationDuration:0.5];
//    cell.layer.transform = CATransform3DIdentity;
//    cell.alpha = 1;
//    cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
//    [UIView commitAnimations];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
