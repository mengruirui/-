//
//  RootTabBarViewController.m
//  ShiMeiZhiJia
//
//  Created by 孟瑞瑞 on 16/6/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "HomePageViewController.h"
#import "RoomViewController.h"
#import "ItemViewController.h"
#import "MyViewController.h"

@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

+(RootTabBarViewController *)standardInstance
{
    static RootTabBarViewController *tabVC = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabVC = [RootTabBarViewController new];
    });
    return tabVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //取消工具栏的透明状态
    self.tabBar.translucent = NO;
    //    self.tabBar.hidden = YES;
    //初始化三个子视图，放到tabbar中
    TRNavigationController *homePageNavi=[[TRNavigationController alloc] initWithRootViewController:[HomePageViewController new]];
    TRNavigationController *roomNavi=[[TRNavigationController alloc] initWithRootViewController:[RoomViewController new]];
    TRNavigationController *itemNavi=[[TRNavigationController alloc] initWithRootViewController:[ItemViewController new]];
    TRNavigationController *myNavi=[[TRNavigationController alloc] initWithRootViewController:[MyViewController new]];
    self.viewControllers=@[homePageNavi,roomNavi,itemNavi,myNavi];
    homePageNavi.tabBarItem.title = LocalizedString(@"home");
    homePageNavi.tabBarItem.image = [[UIImage imageNamed:@"home_moren"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homePageNavi.tabBarItem.selectedImage = [[UIImage imageNamed:@"home_gaoliang"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    
    roomNavi.tabBarItem.title = LocalizedString(@"room");
    roomNavi.tabBarItem.image = [[UIImage imageNamed:@"fanganku"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    roomNavi.tabBarItem.selectedImage = [[UIImage imageNamed:@"fanganku_right"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
   
    itemNavi.tabBarItem.title = LocalizedString(@"item");
    itemNavi.tabBarItem.image = [[UIImage imageNamed:@"danpin_bg"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    itemNavi.tabBarItem.selectedImage = [[UIImage imageNamed:@"danpin_bg_right"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    
    myNavi.tabBarItem.title = LocalizedString(@"my");
    myNavi.tabBarItem.image = [[UIImage imageNamed:@"my_center_moren"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    myNavi.tabBarItem.selectedImage = [[UIImage imageNamed:@"my_center_gaoliang"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];


}

////状态栏白色
//-(UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
