//
//  CustomHouseViewModel.m
//  ShiMeiZhiJia
//
//  Created by 孟瑞瑞 on 16/6/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "CustomHouseViewModel.h"
#import "HomePageNetManager.h"
#import "CustomHouseModel.h"
@implementation CustomHouseViewModel
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    [self cancelTask];
    self.dataTask = [HomePageNetManager getCustomHouseCompletionHandle:^(id model, NSError *error) {
        if (!error) {
            [self.dataArr addObjectsFromArray:model];
        }
        completionHandle(error);
    }];
}
- (CustomHouseModel *)modelForRowInArray
{
    return self.dataArr.firstObject;
}
-(NSURL *)customHouseImageURL
{
    return [NSURL URLWithString:[self modelForRowInArray].Img];
}
-(NSURL *)customHouseUrl
{
    return [NSURL URLWithString:[self modelForRowInArray].Url];
}

@end
