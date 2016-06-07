//
//  TRNavigationController.m
//  我的微信
//
//  Created by xiaoz on 15/9/18.
//  Copyright (c) 2015年 xiaoz. All rights reserved.
//

#import "TRNavigationController.h"


@interface TRNavigationController ()

@end

@implementation TRNavigationController

/* 第一次使用这个类或者这个子类时自动执行  */
+ (void)initialize
{
    if (self == [TRNavigationController class])
    {
        // 0.获取导航条外观
        UINavigationBar *bar = [UINavigationBar appearance];
        [bar setTranslucent:NO];
        // 1.设置背景色
        [bar setBarTintColor: [UIColor colorWith255Red:254 green:210 blue:10 alpha:1]];
        //[bar setBackgroundColor:[UIColor redColor]];
        // 2.设置背景图
        //[bar setBackgroundImage:[UIImage imageNamed:@"navibg"] forBarMetrics:UIBarMetricsDefault];

        // 3.设置左右按钮的文字颜色
        //[bar setTintColor:kRGBColor(254, 123, 0)];
        
        // 4.设置标题文字的垂直位置
        [bar setTitleVerticalPositionAdjustment:0 forBarMetrics:UIBarMetricsDefault];
        
        // 5.设置导航栏的样式--影响状态栏中文字的颜色
        //[bar setBarStyle:UIBarStyleBlack];
        
        // 6.设置标题栏文字的样式
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];
        attributes[NSForegroundColorAttributeName] = kRGBColor(47, 46, 36);
        [bar setTitleTextAttributes:attributes];
        
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *selectedImage = [self.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem.selectedImage = selectedImage;
    
}


@end
