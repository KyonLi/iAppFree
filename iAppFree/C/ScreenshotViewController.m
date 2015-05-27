//
//  ScreenshotViewController.m
//  iAppFree
//
//  Created by Kyon on 15/5/27.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import "ScreenshotViewController.h"
#import "UIViewController+CWPopup.h"
#import "UIImageView+WebCache.h"

@interface ScreenshotViewController ()

@end

@implementation ScreenshotViewController

- (void)dealloc {
    [_imageUrl release];
    [_preVC release];
    [super dealloc];
}

- (instancetype)initWithImageUrl:(NSString *)imageUrl andPreVC:(UIViewController *)preVC {
    if (self = [super init]) {
        [self setImageUrl:imageUrl];
        [self setPreVC:preVC];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[self view] setFrame:CGRectMake(0, 0, SCREEN_WIDTH - 40, SCREEN_HEIGHT - 150)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [imageView sd_setImageWithURL:[NSURL URLWithString:_imageUrl] placeholderImage:[UIImage imageNamed:@"egopv_photo_placeholder"]];
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [imageView addGestureRecognizer:tapRecognizer];
    [imageView setUserInteractionEnabled:YES];
    [tapRecognizer release];
    [[self view] addSubview:imageView];
    [imageView release];
}

- (void)tapAction:(UITapGestureRecognizer *)sender {
    [_preVC dismissPopupViewControllerAnimated:YES completion:^{
        [[_preVC navigationController] setNavigationBarHidden:NO animated:YES];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
