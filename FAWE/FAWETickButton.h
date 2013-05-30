//
//  ShowellTickButton.h
//  FAWE
//
//  Created by Juha Suni on 24.5.2013.
//  Copyright (c) 2013 Media Cabinet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+FontAwesome.h"
#import <QuartzCore/QuartzCore.h>

@interface FAWETickButton : UIButton

@property (nonatomic, strong) CAShapeLayer *circleLayer;
@property (nonatomic, strong) UIColor *circleColor;

- (void)setIcon:(FAWEIcon)icon forState:(UIControlState)state;

- (void)setIconColor:(UIColor *)color forState:(UIControlState)state;
@end
