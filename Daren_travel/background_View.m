//
//  background_View.m
//  Daren_travel
//
//  Created by app le on 2017/7/22.
//  Copyright © 2017年 InformationTeam. All rights reserved.
//

#import "background_View.h"

@implementation background_View{
    NSArray *imgname;
    NSArray *imglable;
    BOOL isopen;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        imgname = @[@"加油卡",@"充值",@"我的车辆",@"消息"];
        imglable = @[@"办理油卡",@"油卡充值",@"我的车辆",@"消息中心"];
        self.backgroundColor = [UIColor whiteColor];
        
        _seeOrnoSee = [[UIButton alloc] initWithFrame:CGRectMake(Main_Width / 2-10, 0, 20, 20)];
        [_seeOrnoSee setImage:[UIImage imageNamed:@"下拉"] forState:UIControlStateNormal];
        [_seeOrnoSee addTarget:self action:@selector(clickone:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:_seeOrnoSee];
        
        _recommend = [UIButton buttonWithType:UIButtonTypeCustom];
        _recommend.frame = CGRectMake(15, 20, Main_Width / 2 -30, Main_Height / 2/ 7);
        _recommend.backgroundColor = [UIColor colorWithRed:35/255.0 green:207/255.0 blue:220/255.0 alpha:1];
        _recommend.layer.cornerRadius = 6;
        _recommend.layer.shadowColor = [UIColor grayColor].CGColor;
        _recommend.layer.shadowOffset = CGSizeMake(5, 5);
        _recommend.layer.shadowOpacity = 0.5;
        _recommend.layer.shadowRadius = 6;
        [_recommend setTitle:@"推荐加油" forState:UIControlStateNormal];
        [self addSubview:_recommend];
        
        _selected = [UIButton buttonWithType:UIButtonTypeCustom];
        _selected.frame = CGRectMake(Main_Width / 2 + 15, 20, Main_Width / 2 -30, Main_Height / 2 / 7);
        [_selected setBackgroundColor:[UIColor whiteColor]];
        _selected.layer.cornerRadius = 6;
        _selected.layer.shadowColor = [UIColor grayColor].CGColor;
        _selected.layer.shadowOffset = CGSizeMake(5, 5);
        _selected.layer.shadowOpacity = 0.5;
        _selected.layer.shadowRadius = 6;
        [_selected setTitleColor:[UIColor colorWithRed:35/255.0 green:207/255.0 blue:220/255.0 alpha:1] forState:UIControlStateNormal];
        [_selected setTitle:@"选择加油" forState:UIControlStateNormal];
        [self addSubview:_selected];
        
        for (int i = 0; i < 4; i ++) {
            
            custom_Btn *btn = [[custom_Btn alloc] initWithFrame:CGRectMake(Main_Width /4 * i, 30 +Main_Height / 2/ 7, Main_Width / 4, Main_Width / 4)];
        
            [btn setImage:[UIImage imageNamed:imgname[i]] forState:UIControlStateNormal];
            [btn setTitle:imglable[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.ratio = 0.5;
            [self addSubview:btn];
            
            
        }
        
        _ad_img = [[UIImageView alloc] initWithFrame:CGRectMake(0, Main_Height / 2 /7 + 30 + Main_Width / 4, Main_Width, Main_Height/2 - Main_Height / 2 /7 + 30 + Main_Width / 4-44)];
        
        [_ad_img setImage:[UIImage imageNamed:@"testimg"]];
        [self addSubview:_ad_img];
        
//        [_recommend mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_offset(64);
//            make.left.mas_offset(30);
//        }];
        
    }
    return self;
}


- (void)clickone:(UIButton *)btn {
    
    if (!isopen) {
        [UIView animateWithDuration:0.5 animations:^{
            btn.imageView.transform = CGAffineTransformMakeRotation(M_PI);
            self.frame = CGRectMake(0, Main_Height / 2 + (Main_Height /2 - Main_Height /2/7 - 30)- Main_Height /2/7, Main_Width, Main_Height / 2 -44);
        } completion:^(BOOL finished) {
            isopen = YES;
        }];

    }else {
        [UIView animateWithDuration:0.5 animations:^{
            btn.imageView.transform = CGAffineTransformIdentity;
            self.frame = CGRectMake(0, Main_Height/2 - 44, Main_Width, Main_Height/2);
        } completion:^(BOOL finished) {
            isopen = NO;
        }];
    }
   }
@end
