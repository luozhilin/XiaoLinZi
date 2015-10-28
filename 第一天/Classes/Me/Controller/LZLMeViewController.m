//
//  LZLMeViewController.m
//  第一天
//
//  Created by 罗志林 on 15/9/29.
//  Copyright © 2015年 luozhilin. All rights reserved.
//

#import "LZLMeViewController.h"

#import "LZLMeTableViewController.h"

@interface LZLMeViewController ()

@end

@implementation LZLMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的";

    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(meSettingClick)];

    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(meMoonClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
}

- (void)meMoonClick
{
    LZLLogFuc;
}

- (void)meSettingClick
{
    LZLMeTableViewController *vc = [[LZLMeTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    LZLLogFuc;
}

@end
