//
//  LZLNavigationController.m
//  第一天
//
//  Created by 罗志林 on 15/9/29.
//  Copyright © 2015年 luozhilin. All rights reserved.
//

#import "LZLNavigationController.h"

@interface LZLNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation LZLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = self;

}

//该方法每次push的时候都会调用，所以可以在这边统一设置leftBarButtonItem的样式
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    NSLog(@"%ld", self.childViewControllers.count); //程序第一次进来 栈里没有控制器 count = 0 (根控制器)
    //判断是否根控制器, 除根控制外都设置统一返回样式
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        
        [btn setTitle:@"返回" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0); //往左边移动10像素
        
        [btn sizeToFit]; //等设置完文字后在自适应
        
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }

    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.childViewControllers.count > 1;
}

@end
