//
//  LZLTabBar.m
//  第一天
//
//  Created by 罗志林 on 15/9/28.
//  Copyright © 2015年 luozhilin. All rights reserved.
//

#import "LZLTabBar.h"

@interface LZLTabBar ()

@property(nonatomic, weak) UIButton *btn;


@end

@implementation LZLTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];

        //此时frame的属性是0，可以在layoutSubviews里设置
//        btn.frame = CGRectMake(0, 0, self.bounds.size.width / 5, self.bounds.size.height);
//        
//        btn.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
        
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
        
        self.btn = btn;
    }

    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;

    //设置添加按钮的位置
    self.btn.frame = CGRectMake(0, 0, w / 5, h);
    self.btn.center = CGPointMake(w * 0.5, h * 0.5);
    
    CGFloat btnW = w / 5;
    CGFloat btnH = h;
    CGFloat btnY = 0;
    
    int index = 0;
    for (UIView *tabBarButton in self.subviews) {
        //查找子控件UITabBarButton类，该控件是系统用的，不提供给开发者使用
        NSString *clazzStr = NSStringFromClass(tabBarButton.class);
        if (![clazzStr isEqualToString:@"UITabBarButton"]) {
            continue;
        }
        
        CGFloat btnX = (index++) * btnW;
        if (index > 2) {
            btnX += btnW;
        }
        tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}

- (void)btnClick
{
    LZLLog(@"btnClick");
}

@end
