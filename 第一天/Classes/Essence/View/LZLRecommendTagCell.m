//
//  LZLRecommendTagCell.m
//  第一天
//
//  Created by 罗志林 on 15/10/8.
//  Copyright © 2015年 luozhilin. All rights reserved.
//

#import "LZLRecommendTagCell.h"

#import <UIImageView+WebCache.h>

@interface LZLRecommendTagCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageListView;
@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;


@end

@implementation LZLRecommendTagCell

- (void)setRecommendTag:(LZLRecommendTag *)recommendTag
{
    _recommendTag = recommendTag;
    
//    [self.imageListView sd_setImageWithURL:[NSURL URLWithString:recommendTag.image_list] placeholderImage:nil];
    [self.imageListView sd_setImageWithURL:[NSURL URLWithString:recommendTag.image_list] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {

        //裁剪圆
        
        UIGraphicsBeginImageContext(image.size);
        
        CGContextRef contextRef = UIGraphicsGetCurrentContext(); //

        CGRect rect = {CGPointZero, image.size};
        
        CGContextAddEllipseInRect(contextRef, rect);
        
        CGContextClip(contextRef);
        
        [image drawInRect:rect];
        
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        self.imageListView.image = img;
        
    }];
    self.themeNameLabel.text = recommendTag.theme_name;
    if (recommendTag.sub_number >= 10000) {
        self.subNumberLabel.text = [NSString stringWithFormat:@"%.1f万人推荐", recommendTag.sub_number / 10000.0];
    } else {
        self.subNumberLabel.text = [NSString stringWithFormat:@"%zd人推荐", recommendTag.sub_number];
    }
}

- (void)setFrame:(CGRect)frame
{
    frame.size.height -= 1;
    [super setFrame:frame];
}

@end
