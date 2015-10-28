//
//  LZLTabBarController.m
//  第一天
//
//  Created by 罗志林 on 15/9/28.
//  Copyright © 2015年 luozhilin. All rights reserved.
//

#import "LZLTabBarController.h"

#import "LZLTabBar.h"

#import "LZLNavigationController.h"

#import "LZLEssenceViewController.h"
#import "LZLFriendTrendsViewController.h"
#import "LZLNewViewController.h"
#import "LZLMeViewController.h"

@interface LZLTabBarController ()

@end

@implementation LZLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置文本属性
    [self setUpTextAttr];
    
    //添加子视图控制器
    [self setUpChildVcs];
    
    //自定义UITabBar来管理子控件的布局
    [self setUpTabBar];
}

- (void)setUpTabBar
{
//    self.tabBar = [[LZLTabBar alloc] init];
    
    //由于UITabBar为只读，所以可以用KVC来做
    [self setValue:[[LZLTabBar alloc] init] forKey:@"tabBar"];
}

- (void)setUpTextAttr
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    dict[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedDict = [NSMutableDictionary dictionary];
    selectedDict[NSForegroundColorAttributeName] = [UIColor darkGrayColor];

    //方法后面有UI_APPEARANCE_SELECTOR宏，才能设置appearance
    //设置统一属性
    UITabBarItem *tabBarItem = [UITabBarItem appearance];

    [tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:selectedDict forState:UIControlStateSelected];
}

- (void)setUpChildVcs
{   
    [self addChildWithVc:[[LZLEssenceViewController alloc] init] title:@"精华" img:@"tabBar_essence_icon" selectedImg:@"tabBar_essence_click_icon"];

    LZLFriendTrendsViewController *friendTrendsVC = [UIStoryboard storyboardWithName:NSStringFromClass([LZLFriendTrendsViewController class]) bundle:nil].instantiateInitialViewController;
    [self addChildWithVc:friendTrendsVC title:@"关注" img:@"tabBar_friendTrends_icon" selectedImg:@"tabBar_friendTrends_click_icon"];
    
    [self addChildWithVc:[[LZLNewViewController alloc] init] title:@"新帖" img:@"tabBar_new_icon" selectedImg:@"tabBar_new_click_icon"];
    
//    [self addChildWithVc:[[UIViewController alloc] init] title:nil img:nil selectedImg:nil];
    
    [self addChildWithVc:[[LZLMeViewController alloc] init] title:@"我" img:@"tabBar_me_icon" selectedImg:@"tabBar_me_click_icon"];
}

- (void)addChildWithVc:(UIViewController *)vc title:(NSString *)title img:(NSString *)img selectedImg:(NSString *)selectedImg
{
    //设置控制器视图的统一背景颜色
    vc.view.backgroundColor = LZLGrayColor(206);
    
    LZLNavigationController *nav = [[LZLNavigationController alloc] initWithRootViewController:vc];
    
//    vc.view.backgroundColor = LZLRandomColor;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed: img];
    vc.tabBarItem.selectedImage = [UIImage imageNamed: selectedImg];
    
    [self addChildViewController:nav];
}

//在控制器视图加载完成后(tabBar中的子控件加载完成)，即将显示的时候设置添加的按钮(这时候按钮就不会被子控件覆盖了)
//通常不这么做，最好自己写个类继承UITabBar来管理子控件的布局子控件
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//
//    static dispatch_once_t onceT;
//
//    dispatch_once(&onceT, ^{
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//
//        [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
//
//        btn.frame = CGRectMake(0, 0, self.tabBar.bounds.size.width / 5, self.tabBar.bounds.size.height);
//
//        btn.center = CGPointMake(self.tabBar.bounds.size.width * 0.5, self.tabBar.bounds.size.height * 0.5);
//
//        //    [btn sizeToFit];
//
//        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//
//        [self.tabBar addSubview:btn];
//    });
//}

@end
