//
//  BannerViewModel.m
//  ShiMeiZhiJia
//
//  Created by 孟瑞瑞 on 16/6/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BannerViewModel.h"
#import "BannerModel.h"
#import "HomePageNetManager.h"

@implementation BannerViewModel
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    [self cancelTask];
    self.dataTask = [HomePageNetManager getBannerCompletionHandle:^(id model, NSError *error) {
        if (!error) {
            [self.dataArr addObjectsFromArray:model];
        }
        completionHandle(error);
    }];
}
- (BannerModel *)modelForRowInArray
{
    return self.dataArr.firstObject;
}
-(NSURL *)bannerImageURL
{
    return [NSURL URLWithString:[self modelForRowInArray].ShareImg];
}
-(NSURL *)bannerShareUrl
{
    return [NSURL URLWithString:[self modelForRowInArray].ShareUrl];
}
@end
