//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "HomePageNetManager.h"
#import "BargainingActivityModel.h"
#import "BannerModel.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    //闪屏效果时间增长
    //[NSThread sleepForTimeInterval:3];
    [HomePageNetManager getBargainingActivityWithPage:0 completionHandle:^(BargainingActivityModel *model, NSError *error) {
        NSLog(@"88888888");
       
    }];
    [HomePageNetManager getBannerCompletionHandle:^(BannerModel *model, NSError *error) {
        NSLog(@"lalalalal");
       
    }];
    [HomePageNetManager getCustomHouseCompletionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"777777777");
    }];
    return YES;
}

@end
