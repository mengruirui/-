//
//  TRTabBarController.m
//  我的微信
//
//  Created by xiaoz on 15/9/18.
//  Copyright (c) 2015年 xiaoz. All rights reserved.
//

#import "TRTabBarController.h"


@interface TRTabBarController ()

@end

@implementation TRTabBarController

+ (void)initialize
{
    if (self == [TRTabBarController class]) {
        // 0.获取TabBar的外观
        UITabBar *tabBar = [UITabBar appearance];
        // 1.设置背景图
        //[tabBar setBackgroundImage:[UIImage imageNamed:@"tabbarBkg"]];
        
        // 2.设置bar上被选中的项的背景图
        //[tabBar setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar_selected_back"]];
        
        // 获取UITabBarItem的风格
        UITabBarItem *barItem = [UITabBarItem appearance];
        // 1.设置item中文字的位置
        [barItem setTitlePositionAdjustment:UIOffsetMake(0, -1)];
        
        // 2.设置item中文字的普通样式
        NSMutableDictionary *normalAttrbiutes = [NSMutableDictionary dictionary];
        normalAttrbiutes[NSForegroundColorAttributeName] = kRGBColor(128, 128, 128);
        normalAttrbiutes[NSFontAttributeName] = [UIFont systemFontOfSize:11];
        [barItem setTitleTextAttributes:normalAttrbiutes forState:UIControlStateNormal];
        
        // 3.设置item中文字被选中时的样式
        NSMutableDictionary *selectedAttrbiutes = [NSMutableDictionary dictionary];
        selectedAttrbiutes[NSForegroundColorAttributeName] = kRGBColor(254, 123, 0);
        selectedAttrbiutes[NSFontAttributeName] = [UIFont systemFontOfSize:11];
        [barItem setTitleTextAttributes:selectedAttrbiutes forState:UIControlStateSelected];
        
        
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
