//
//  LZLLoginRegisterTextField.m
//  第一天
//
//  Created by 罗志林 on 15/10/1.
//  Copyright © 2015年 luozhilin. All rights reserved.
//

#import "LZLLoginRegisterTextField.h"

//placeholderLabel是靠经验才出来的，可以死记硬背记下来
#define LZLPlaceholderColorKey @"placeholderLabel.textColor"

@implementation LZLLoginRegisterTextField

- (void)awakeFromNib
{
    //将光标设置成白色
    self.tintColor = [UIColor whiteColor];
    //设置文本颜色
    self.textColor = [UIColor whiteColor];
    //设置占位文本颜色
    [self setValue:[UIColor grayColor] forKeyPath:LZLPlaceholderColorKey];
}

//重写该方法，选中的时候设置占位文本颜色
- (BOOL)becomeFirstResponder
{
    [self setValue:[UIColor whiteColor] forKeyPath:LZLPlaceholderColorKey];
    return [super becomeFirstResponder];
}

//重写该方法，不选中的时候设置占位文本颜色
- (BOOL)resignFirstResponder
{
    [self setValue:[UIColor grayColor] forKeyPath:LZLPlaceholderColorKey];
    return [super resignFirstResponder];
}

@end
