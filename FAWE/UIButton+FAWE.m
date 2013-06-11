//
//  UIButton+FAWE.m
//  FAWE
//
//  Created by Juha Suni on 15.3.2013.
//  Copyright (c) 2013, Media Cabinet
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  -   Redistributions of source code must retain the above copyright notice,
//      this list of conditions and the following disclaimer.
//  -   Redistributions in binary form must reproduce the above copyright notice,
//      this list of conditions and the following disclaimer in the documentation
//      and/or other materials provided with the distribution.
//  -   Neither the name of the Media Cabinet nor the names of its contributors
//      may be used to endorse or promote products derived from this software
//      without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
//  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
//  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
//  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
//  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
//  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
//  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
//  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
//  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
//  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import "UIButton+FAWE.h"
#import "FAWEButtonSpecs.h"
#import <objc/runtime.h>

@implementation UIButton(FAWE)

static char FAWE_BUTTON_SPECS_KEY;

@dynamic specs;

- (void)setSpecs:(FAWEButtonSpecs *)specs
{
    objc_setAssociatedObject(self, &FAWE_BUTTON_SPECS_KEY, specs,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (FAWEButtonSpecs *)specs
{
    FAWEButtonSpecs *specs = objc_getAssociatedObject(self, &FAWE_BUTTON_SPECS_KEY);
    
    if (specs == nil) {
        specs = [[FAWEButtonSpecs alloc] init];
        specs.iconAlign = FAWEButtonIconAlignLeft;
        specs.iconEdgeInsets = UIEdgeInsetsZero;
        
        self.specs = specs;
    }
    
    return specs;
}

- (FAWEIconView *)iconView
{
    if (self.specs.iconView == nil) {
        FAWEIconView *iconView = [[FAWEIconView alloc] initWithFrame: CGRectMake(0, 0, 0, 0)];
        iconView.backgroundColor = [UIColor clearColor];
        iconView.textColor = [UIColor whiteColor];
        iconView.iconSize = self.titleLabel.font.lineHeight;
        
        self.specs.iconView = iconView;
        [self addSubview:self.specs.iconView];
    }
    
    return self.specs.iconView;
}

- (void)setIcon:(FAWEIcon)icon
{
    self.iconView.icon = icon;
    [self updateIconFrame];
}

- (FAWEIcon)icon
{
    return self.specs.iconView.icon;
}

- (void)setIconColor:(UIColor *)iconColor
{
    self.iconView.iconColor = iconColor;
}

- (void)setIconEdgeInsets:(UIEdgeInsets)iconEdgeInsets
{
    self.specs.iconEdgeInsets = iconEdgeInsets;
    
    if (self.specs.iconView) {
        [self updateIconFrame];
    }
}

- (UIEdgeInsets)iconEdgeInsets
{
    return self.specs.iconEdgeInsets;
}

- (void)setIconSize:(NSInteger)iconSize
{
    self.specs.iconView.iconSize = iconSize;
    
    if (self.specs.iconView) {
        [self updateIconFrame];
    }
}

- (void)setIconAlign:(FAWEButtonIconAlign)iconAlign
{
    self.specs.iconAlign = iconAlign;

    if (self.specs.iconView) {
        [self updateIconFrame];
    }
}

- (FAWEButtonIconAlign)iconAlign
{
    return self.specs.iconAlign;
}

- (void)updateIconFrame
{
    CGRect icf = [self makeIconFrame];
    self.iconView.frame = icf;
}

- (CGRect)makeIconFrame
{
    CGRect rect;
    CGSize iconSize   = [self.iconView.text sizeWithFont:self.iconView.font];
    NSInteger centerY = self.frame.size.height/2-iconSize.height/2;
    NSInteger centerX = self.frame.size.width/2-iconSize.width/2;
    
    NSInteger width = iconSize.width + self.iconEdgeInsets.left + self.iconEdgeInsets.right;
    NSInteger height = iconSize.height + self.iconEdgeInsets.top + self.iconEdgeInsets.bottom;

    if (self.iconAlign == FAWEButtonIconAlignRight) {
        rect = CGRectMake(self.frame.size.width - iconSize.width, centerY, width, height);
    } else if (self.iconAlign == FAWEButtonIconAlignCenter) {
        rect = CGRectMake(centerX, centerY, width, height);
    } else {
        // Left
        rect = CGRectMake(0, centerY, width, height);
    }
    
    rect = UIEdgeInsetsInsetRect(rect, self.iconEdgeInsets);
    
    return rect;
}

@end
