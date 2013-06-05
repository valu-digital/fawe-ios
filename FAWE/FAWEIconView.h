//
//  FAWEconView.h
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

#import <UIKit/UIKit.h>
#import "NSString+FontAwesome.h"

// A view for rendering Font Awesome icons. Other components
// of FAWE library utilize this class but it can be as well
// used as a standalone view component. It is recommended to
// initialize the component using |initWithIcon|.
@interface FAWEIconView : UILabel

@property (nonatomic) CGGradientRef gradient;
@property (nonatomic) CGFloat iconSize;
@property (nonatomic) CGSize innerShadowOffset;
@property (nonatomic) CGFloat innerShadowBlur;
@property (nonatomic, strong) UIColor *innerShadowColor;

- (id)initWithIcon:(FAWEIcon)icon withSize:(CGFloat)iconSize andOrigin:(CGPoint)origin;
- (void)setIcon:(FAWEIcon)icon;
- (FAWEIcon)icon;
- (void)setIconColor:(UIColor *)iconColor;
- (void)setGradientWithColors:(NSArray *)colors andLocations:(CGFloat[])locations;

@end
