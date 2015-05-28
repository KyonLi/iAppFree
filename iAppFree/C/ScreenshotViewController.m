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
{
    CGFloat _viewWidth;
    CGFloat _viewHeight;
}
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

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    UIImageView *imageView = [[UIImageView alloc] init];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:_imageUrl]];
    if (data) {
        UIImage *image = [UIImage imageWithData:data];
        [imageView setImage:image];
        CGSize imageSize = image.size;
        if (_viewWidth / imageSize.width * imageSize.height < _viewHeight) {
            [[self view] setFrame:CGRectMake(10, (_viewHeight - _viewWidth / imageSize.width * imageSize.height) / 2, _viewWidth, _viewWidth / imageSize.width * imageSize.height)];
        } else {
            [[self view] setFrame:CGRectMake((_viewWidth - _viewHeight / imageSize.height * imageSize.width) / 2, 20, _viewHeight / imageSize.height * imageSize.width, _viewHeight)];
        }
    } else {
        UIImage *image = [UIImage imageNamed:@"egopv_photo_placeholder"];
        [imageView setImage:image];
        CGSize imageSize = image.size;
        if (_viewWidth / imageSize.width * imageSize.height < _viewHeight) {
            [[self view] setFrame:CGRectMake(10, (_viewHeight - _viewWidth / imageSize.width * imageSize.height) / 2, _viewWidth, _viewWidth / imageSize.width * imageSize.height)];
        } else {
            [[self view] setFrame:CGRectMake((_viewWidth - _viewHeight / imageSize.height * imageSize.width) / 2, 20, _viewHeight / imageSize.height * imageSize.width, _viewHeight)];
        }
    }
    [imageView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [imageView addGestureRecognizer:tapRecognizer];
    [imageView setUserInteractionEnabled:YES];
    [tapRecognizer release];
    [[self view] addSubview:imageView];
    [imageView release];
    [SVProgressHUD dismiss];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [SVProgressHUD show];
    _viewWidth = self.view.frame.size.width-20;
    _viewHeight = self.view.frame.size.height-40;
    [[self view] setFrame:CGRectMake(0, 0, 0, 0)];
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
