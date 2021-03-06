//
//  SwbADC_TabBarBadge.m
//  WheelSylloge
//
//  Created by 工作 on 2018/7/9.
//  Copyright © 2018年 万恶的小彬彬. All rights reserved.
//

#import "SwbADC_TabBarBadge.h"
#import "UIView+SWB.h"
#import "SwbADC_TabBarTool.h"
#import "CAAnimation+SWB.h"

@implementation SwbADC_TabBarBadge

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.badgeLabel = [[UILabel alloc]initWithFrame:self.bounds];
        self.badgeLabel.textColor = UIColor.whiteColor;
        self.badgeLabel.font = [UIFont boldSystemFontOfSize:10.f];
        self.badgeLabel.textAlignment = NSTextAlignmentCenter;
        self.badgeLabel.layer.cornerRadius = frame.size.height/2;
        self.badgeLabel.layer.masksToBounds = YES;
        self.badgeLabel.backgroundColor = UIColor.redColor;
        self.userInteractionEnabled = NO;
//        self.automaticHidden = YES;
        [self addSubview:self.badgeLabel];
        self.hidden = YES;
    }
    return self;
}

- (void)setType:(SWBBadgeValueType)type
{
    _type = type;
//    self.hidden = NO;
    switch (type) {
        case SWBBadgeValueTypeDot:
            {
                self.badgeLabel.size = CGSizeMake(8, 8);
                self.badgeLabel.layer.cornerRadius = self.badgeLabel.size.height/2;
                self.badgeLabel.x = 0;
                self.badgeLabel.y = self.height * 0.5 - self.badgeLabel.size.height * 0.5;
                self.badgeLabel.text = @"";
            }
            break;
            
        case SWBBadgeValueTypeNew:
            {
                self.badgeLabel.size = CGSizeMake(self.width, self.height);
                self.badgeLabel.layer.cornerRadius = self.badgeLabel.size.height/2;
                self.badgeLabel.text = @"new";
            }
            break;
            
        case SWBBadgeValueTypeNumber:
            {
                CGSize size = CGSizeZero;
                if (self.badgeLabel.text.length <= 1) {
                    size = CGSizeMake(self.height, self.height);
                }else if (self.badgeLabel.text.length > 1) {
                    size = self.bounds.size;
                }
                self.badgeLabel.size = size;
                self.badgeLabel.layer.cornerRadius = self.height * 0.5;
            }
            break;
            
        default:
            break;
    }
    
    SWBTabBarBadgeAnimationType animationType = self.badgeAnimationType;
    if (animationType == SWBTabBarBadgeAnimationTypeShake) {
        //抖动动画
        [self.badgeLabel.layer addAnimation:[CAAnimation shakeAnimationRepeatTimes:5] forKey:@"shakeAnimation"];
    }else if (animationType == SWBTabBarBadgeAnimationTypeOpacity) {
        //透明过度动画
        [self.badgeLabel.layer addAnimation:[CAAnimation opacityAnimationDurationTimes:0.3] forKey:@"opacityAnimation"];
    }else if (animationType == SWBTabBarBadgeAnimationTypeScale) {
        [self.badgeLabel.layer addAnimation:[CAAnimation scaleAnimation] forKey:@"scaleAnimation"];
    }
}

- (CGSize)sizeWithAttribute:(NSString *)text {
    return [text sizeWithAttributes:@{NSFontAttributeName:self.badgeLabel.font}];
}

- (void)setBadgeText:(NSString *)badgeText
{
    _badgeText = badgeText;
    self.badgeLabel.text = badgeText;
    if (badgeText.integerValue) {
        self.hidden = NO;
        if (badgeText.integerValue > 99) {
            self.badgeLabel.text = @"99+";
        }
    }else {
        self.hidden = self.automaticHidden;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
