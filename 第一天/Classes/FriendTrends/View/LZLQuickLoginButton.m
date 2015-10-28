//
//  LZLQuickLoginButton.m
//  第一天
//
//  Created by 罗志林 on 15/9/30.
//  Copyright © 2015年 luozhilin. All rights reserved.
//

#import "LZLQuickLoginButton.h"

@implementation LZLQuickLoginButton

- (void)awakeFromNib
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置图片
    self.imageView.y = 0;
    self.imageView.centerX = self.width * 0.5;
    
    // 设置文字
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
}


@end
