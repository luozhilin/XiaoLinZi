//
//  LZLFriendTrendsViewController.m
//  第一天
//
//  Created by 罗志林 on 15/9/29.
//  Copyright © 2015年 luozhilin. All rights reserved.
//

#import "LZLFriendTrendsViewController.h"
#import "LZLLoginRegisterViewController.h"

@interface LZLFriendTrendsViewController ()

@end

@implementation LZLFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的关注";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(friendTrendsClick)];
}

- (void)friendTrendsClick
{
    LZLLogFuc;
}

- (IBAction)backToFriendTrendsVC:(UIStoryboardSegue *)segue
{
    
}



@end
