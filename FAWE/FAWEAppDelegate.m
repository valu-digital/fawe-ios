//
//  FAWEAppDelegate.m
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

#import "FAWEAppDelegate.h"
#import "FAWEIconView.h"
#import "UIButton+FAWE.h"

@implementation FAWEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIViewController *viewController = [[UIViewController alloc] init];
    self.window.rootViewController = viewController;
    
    UIView *view = viewController.view;
    
    FAWEIconView *simpleIcon;
    FAWEIconView *gradientIcon;
    FAWEIconView *innerShadowIcon;
    FAWEIconView *gradientShadowIcon;
    NSInteger y = 0;
    NSInteger sizes[4] = {100, 50, 25, 12};
    
    for (int row=0; row < 4; row++) {
        simpleIcon = [[FAWEIconView alloc] initWithIcon:FAWEIconAmbulance withSize:sizes[row] andOrigin:CGPointMake(0, y)];
        [view addSubview:simpleIcon];
        
        gradientIcon = [[FAWEIconView alloc] initWithIcon:FAWEIconAmbulance withSize:sizes[row] andOrigin:CGPointMake(120, y)];
        [gradientIcon setGradientWithColors:[NSArray arrayWithObjects:[UIColor whiteColor], [UIColor blackColor], nil] andLocations:nil];
        [view addSubview:gradientIcon];
        
        innerShadowIcon = [[FAWEIconView alloc] initWithIcon:FAWEIconAmbulance withSize:sizes[row] andOrigin:CGPointMake(240, y)];
        innerShadowIcon.textColor = [UIColor whiteColor];
        innerShadowIcon.innerShadowBlur = 4.0f;
        innerShadowIcon.innerShadowColor = [UIColor blackColor];
        innerShadowIcon.innerShadowOffset = CGSizeMake(2, 2);
        [view addSubview:innerShadowIcon];
        
        gradientShadowIcon = [[FAWEIconView alloc] initWithIcon:FAWEIconAmbulance withSize:sizes[row] andOrigin:CGPointMake(360, y)];
        [gradientShadowIcon setGradientWithColors:[NSArray arrayWithObjects:[UIColor whiteColor], [UIColor colorWithWhite:0.6 alpha:1.0], nil] andLocations:nil];
        gradientShadowIcon.innerShadowColor = [UIColor blackColor];
        gradientShadowIcon.innerShadowBlur = 4.0f;
        gradientShadowIcon.innerShadowOffset = CGSizeMake(2, 2);
        [view addSubview:gradientShadowIcon];
        
        y += sizes[row]+10;
    }
    
    UIButton *leftAligned = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    leftAligned.frame = CGRectMake(0, y, 100, 30);
    [leftAligned setIconColor:[UIColor blackColor]];
    [leftAligned setIconEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    [leftAligned setIcon:FAWEIconCaretLeft];
    [leftAligned setTitle:@"Left" forState:UIControlStateNormal];
    leftAligned.titleLabel.font = [UIFont systemFontOfSize:14];
    [view addSubview:leftAligned];
    
    UIButton *centerAligned = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    centerAligned.frame = CGRectMake(120, y, 100, 30);
    [centerAligned setIconAlign:FAWEButtonIconAlignCenter];
    [centerAligned setIconColor:[UIColor blackColor]];
    [centerAligned setIcon:FAWEIconCaretDown];
    [centerAligned setIconSize:10];
    [centerAligned setIconEdgeInsets:UIEdgeInsetsMake(20, 0, 0, 0)];
    [centerAligned setTitle:@"Settings" forState:UIControlStateNormal];
    centerAligned.titleLabel.font = [UIFont systemFontOfSize:14];
    [view addSubview:centerAligned];
    
    UIButton *rightAligned = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rightAligned.frame = CGRectMake(240, y, 100, 30);
    [rightAligned setIconAlign:FAWEButtonIconAlignRight];
    [rightAligned setIconColor:[UIColor blackColor]];
    [rightAligned setIconEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
    [rightAligned setIcon:FAWEIconCaretRight];
    [rightAligned setTitle:@"Next" forState:UIControlStateNormal];
    rightAligned.titleLabel.font = [UIFont systemFontOfSize:14];
    [view addSubview:rightAligned];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
