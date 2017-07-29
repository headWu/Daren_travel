//
//  custom_Btn.m
//  Daren_travel
//
//  Created by app le on 2017/7/25.
//  Copyright © 2017年 InformationTeam. All rights reserved.
//

#import "custom_Btn.h"

@implementation custom_Btn

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat x = 0;
    CGFloat y = 5;
    CGFloat w = CGRectGetWidth(contentRect);
    CGFloat h = CGRectGetHeight(contentRect) * _ratio;
    return CGRectMake(x, y, w, h);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat x = 0;
    CGFloat y = CGRectGetHeight(contentRect) * _ratio;
    CGFloat w = CGRectGetWidth(contentRect);
    CGFloat h = CGRectGetHeight(contentRect) *(1-_ratio);
    return  CGRectMake(x, y, w, h);
}
@end
