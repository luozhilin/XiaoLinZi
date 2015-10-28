//
//  UIBarButtonItem+LZLExtends.h
//  第一天
//
//  Created by 罗志林 on 15/9/29.
//  Copyright © 2015年 luozhilin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LZLExtends)
+ (instancetype)itemWithImage:(NSString *)imageStr highImage:(NSString *)hightImageStr target:(id)target action:(SEL)action;
@end
