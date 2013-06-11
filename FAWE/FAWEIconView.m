//
//  FAWEIconView.m
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

#import "FAWEIconView.h"
#import "NSString+FontAwesome.h"

typedef NS_ENUM(int, FAWEIconLayer) {
    FAWEIconLayerShadow     = 1,
    FAWEIconLayerGradient
};

@implementation FAWEIconView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.iconSize = 20;
        self.backgroundColor = [UIColor clearColor];
        self.gradient = nil;
        self.innerShadowOffset = CGSizeMake(0, 0);
        self.innerShadowColor = nil;
        self.innerShadowBlur = 1.0f;
    }
    
    return self;
}

- (id)initWithIcon:(FAWEIcon)icon withSize:(CGFloat)iconSize andOrigin:(CGPoint)origin
{
    UIFont *font = [UIFont fontWithName:kFontAwesomeFamilyName size:iconSize];
    CGSize size = [[NSString fontAwesomeIconStringForEnum:icon] sizeWithFont:font];
    
    self = [self initWithFrame:CGRectMake(origin.x, origin.y, size.width+size.width/20, size.height)];
    
    if (self) {
        self.icon = icon;
        self.iconSize = iconSize;
    }
    
    return self;
}

- (void)setIcon:(FAWEIcon)icon
{
    self.text = [NSString fontAwesomeIconStringForEnum:icon];
}

- (FAWEIcon)icon
{
    return [NSString fontAwesomeEnumForIconIdentifier:self.text];
}

- (void)setIconSize:(CGFloat)iconSize
{
    _iconSize = iconSize;
    self.font = [UIFont fontWithName:kFontAwesomeFamilyName size:self.iconSize];
}

- (void)setIconColor:(UIColor *)iconColor
{
    self.textColor = iconColor;
}

- (void)setGradientWithColors:(NSArray *)colors andLocations:(CGFloat[])locations
{
    // Transfer UIColors to array of CGColors
    NSMutableArray *cgColors = [[NSMutableArray alloc] init];
    for (UIColor *color in colors) {
        [cgColors addObject:(id)color.CGColor];
    }

    CFArrayRef finalColors = (__bridge CFArrayRef)cgColors;
    self.gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), finalColors, locations);
    //CFRelease(finalColors);
}

- (void)drawRect:(CGRect)rect {
    
    // Draw default if no layers are needed
    if (self.innerShadowColor == nil && self.gradient == nil) {
        [super drawRect:rect];
        return;
    }
    
    CGSize fontSize = [self.text sizeWithFont:self.font];
    UIImage *gradient;
    UIImage *innerShadow;
    
    // Create gradient layer
    if (self.gradient != nil) {
        gradient = [self drawLayer:rect preClip:^{
            CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), self.gradient, CGPointZero, CGPointMake(0, self.frame.size.height), kCGGradientDrawsAfterEndLocation);
        } postClip:nil];
    }
    
    // Create inner shadow layer
    if (self.innerShadowColor != nil) {
        innerShadow = [self drawLayer:rect preClip:nil postClip:^{
            CGContextSetShadowWithColor(UIGraphicsGetCurrentContext(), self.innerShadowOffset, self.innerShadowBlur, self.innerShadowColor.CGColor);
        }];
    }

    // Draw actual image
    [self.textColor setFill];
    [self.text drawAtPoint:CGPointMake((self.bounds.size.width/2)-(fontSize.width/2), 0) withFont:self.font];
    
    // Draw layers
    if (gradient != nil) {
        [gradient drawAtPoint:CGPointZero];
    }
    
    if (innerShadow != nil) {
        [innerShadow drawAtPoint:CGPointZero];
    }
}

// Draw a layer that is clipped to the shape of the icon
// Thanks to Steven: http://stackoverflow.com/questions/3231690/inner-shadow-in-uilabel
- (UIImage *)drawLayer:(CGRect)rect preClip:(void (^)(void))preClip postClip:(void (^)(void))postClip
{
    CGSize fontSize = [self.text sizeWithFont:self.font];
    
    CGImageRef mask = [self createMaskWithSize:rect.size shape:^{
        [[UIColor blackColor] setFill];
        CGContextFillRect(UIGraphicsGetCurrentContext(), rect);
        [[UIColor whiteColor] setFill];
        
        // Draw icon
        [self.text drawAtPoint:CGPointMake((self.bounds.size.width/2)-(fontSize.width/2), 0) withFont:self.font];
        [self.text drawAtPoint:CGPointMake((self.bounds.size.width/2)-(fontSize.width/2), 0) withFont:self.font];

        if (preClip != nil) {
            preClip();
        }
    }];
    
    CGImageRef cutoutRef = CGImageCreateWithMask([self blackSquareOfSize:rect.size].CGImage, mask);
    CGImageRelease(mask);
    UIImage *cutout = [UIImage imageWithCGImage:cutoutRef scale:[[UIScreen mainScreen] scale] orientation:UIImageOrientationUp];
    CGImageRelease(cutoutRef);
    
    CGImageRef shadedMask = [self createMaskWithSize:rect.size shape:^{
        [[UIColor whiteColor] setFill];
        
        CGContextFillRect(UIGraphicsGetCurrentContext(), rect);
        if (postClip != nil) {
            postClip();
        }
        
        [cutout drawAtPoint:CGPointZero];
    }];
    
    // Create negative image
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [self.innerShadowColor setFill];
    
    // Draw icon
    [self.text drawAtPoint:CGPointMake((self.bounds.size.width/2)-(fontSize.width/2), -0.5) withFont:self.font];
    UIImage *negative = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGImageRef innerShadowRef = CGImageCreateWithMask(negative.CGImage, shadedMask);
    CGImageRelease(shadedMask);
    UIImage *innerShadow = [UIImage imageWithCGImage:innerShadowRef scale:[[UIScreen mainScreen] scale] orientation:UIImageOrientationUp];
    CGImageRelease(innerShadowRef);
    
    return innerShadow;
}


- (UIImage*)blackSquareOfSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [[UIColor blackColor] setFill];
    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, size.width, size.height));
    UIImage *blackSquare = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return blackSquare;
}

- (CGImageRef)createMaskWithSize:(CGSize)size shape:(void (^)(void))block {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    block();
    CGImageRef shape = [UIGraphicsGetImageFromCurrentImageContext() CGImage];
    UIGraphicsEndImageContext();
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(shape),
                                        CGImageGetHeight(shape),
                                        CGImageGetBitsPerComponent(shape),
                                        CGImageGetBitsPerPixel(shape),
                                        CGImageGetBytesPerRow(shape),
                                        CGImageGetDataProvider(shape), NULL, false);
    return mask;
}

@end
