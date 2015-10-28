//
//  LZLNewViewController.m
//  第一天
//
//  Created by 罗志林 on 15/9/29.
//  Copyright © 2015年 luozhilin. All rights reserved.
//

#import "LZLNewViewController.h"

@interface LZLNewViewController ()

@end

@implementation LZLNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(essenceClick)];
}

- (void)essenceClick
{
    LZLLogFuc;
}

@end
