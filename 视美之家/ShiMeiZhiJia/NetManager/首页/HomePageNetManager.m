//
//  HomePageNetManager.m
//  ShiMeiZhiJia
//
//  Created by 孟瑞瑞 on 16/6/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HomePageNetManager.h"
#import "BannerModel.h"
#import "CustomHouseModel.h"
#import "BargainingActivityModel.h"

#define BannerPath @"http://app5.mm-jia.com/Plugin/Banner/authcode"
#define CustomHousePath @"http://app5.mm-jia.com/C/HdTop/authcode"
#define BargainingActivityPath @"http://app5.mm-jia.com/C/IndexRedBagList/02000105110101061128420205070"

@implementation HomePageNetManager

+(id)getBannerCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    NSDictionary *parameters = @{@"UID":@"0135790",@"authcode":@"727071760016305371970370737071308"};
    return [self GET:BannerPath parameters:parameters completionHandler:^(id responseObj, NSError *error) {
        completionHandle([BannerModel mj_objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

+(id)getCustomHouseCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    NSDictionary *parameters = @{@"Flag":@"0",@"UID":@"727071760016305371970370737071308"};
    return [self GET:CustomHousePath parameters:parameters completionHandler:^(id responseObj, NSError *error) {
        completionHandle([CustomHouseModel mj_objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

+(id)getBargainingActivityWithPage:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle
{
     NSDictionary *parameters = @{@"Page":@(page),@"authcode":@"525051560016305371970350535051308"};
    return [self GET:BargainingActivityPath parameters:parameters completionHandler:^(id responseObj, NSError *error) {
        completionHandle([BargainingActivityModel mj_objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
@end
