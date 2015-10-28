//
//  LZLEssenceViewController.m
//  第一天
//
//  Created by 罗志林 on 15/9/29.
//  Copyright © 2015年 luozhilin. All rights reserved.
//

#import "LZLEssenceViewController.h"
#import "LZLRecommendViewController.h"

@interface LZLEssenceViewController ()

@end

@implementation LZLEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(essenceClick)];
}

- (void)essenceClick
{
    [self.navigationController pushViewController:[[LZLRecommendViewController alloc] init] animated:YES];
}

@end
