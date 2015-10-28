//
//  UIBarButtonItem+LZLExtends.m
//  第一天
//
//  Created by 罗志林 on 15/9/29.
//  Copyright © 2015年 luozhilin. All rights reserved.
//

#import "UIBarButtonItem+LZLExtends.h"

@implementation UIBarButtonItem (LZLExtends)

+ (instancetype)itemWithImage:(NSString *)imageStr highImage:(NSString *)hightImageStr target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn sizeToFit];
    [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:hightImageStr] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
