//
//  LZLLoginRegisterViewController.m
//  第一天
//
//  Created by 罗志林 on 15/9/30.
//  Copyright © 2015年 luozhilin. All rights reserved.
//

#import "LZLLoginRegisterViewController.h"

@interface LZLLoginRegisterViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginConstant;

@end

@implementation LZLLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)loginOrRegister:(UIButton *)button
{
    //    NSLog(@"%d", button.isSelected);
    button.selected = !button.isSelected;
    
    CGFloat constant = self.loginConstant.constant;
    //如果登录界面与父控件约束为0，则往左移动整个屏幕的宽度，否则是注册界面，则登录界面约束还原0
    if (constant == 0) {
        self.loginConstant.constant = -self.view.width;
    } else {
        self.loginConstant.constant = 0;
    }
    
    // 执行动画
    [UIView animateWithDuration:0.25 animations:^{
       //强制重新布局界面
        [self.view layoutIfNeeded];
    }];
}

@end
