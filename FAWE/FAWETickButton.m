//
//  ShowellTickButton.m
//  FAWE
//
//  Created by Juha Suni on 24.5.2013.
//  Copyright (c) 2013 Media Cabinet. All rights reserved.
//

#import "FAWETickButton.h"
#import <QuartzCore/QuartzCore.h>
#import "NSString+FontAwesome.h"

@implementation FAWETickButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.circleColor = [UIColor blackColor];
        
        self.circleLayer = [CAShapeLayer layer];
        self.circleLayer.zPosition = -1;
        
        float radius = self.frame.size.width / 2;
        self.circleLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2.0*radius, 2.0*radius)
                                                 cornerRadius:radius].CGPath;
        self.circleLayer.position = CGPointMake(0, 0);
        
        [self.layer addSublayer:self.circleLayer];
    }
    
    return self;
}

- (void)layoutSubviews
{
    self.titleLabel.frame = self.frame;
    self.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:self.frame.size.width/2];
    
    [super layoutSubviews];
}

- (void)setIcon:(FAWEIcon)icon forState:(UIControlState)state
{
    [super setTitle:[NSString fontAwesomeIconStringForEnum:icon] forState:state];
}

- (void)setIconColor:(UIColor *)color forState:(UIControlState)state
{
    [super setTitleColor:color forState:state];
}

- (void)drawRect:(CGRect)rect
{
//    [super drawRect:rect];
    self.circleLayer.fillColor = self.circleColor.CGColor;
}
@end
