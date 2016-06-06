//
//  BargainingActivityViewModel.m
//  ShiMeiZhiJia
//
//  Created by 孟瑞瑞 on 16/6/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BargainingActivityViewModel.h"
#import "BargainingActivityModel.h"
#import "HomePageNetManager.h"
@implementation BargainingActivityViewModel
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    [self cancelTask];
    self.dataTask = [HomePageNetManager getBargainingActivityWithPage:self.page completionHandle:^(id model, NSError *error) {
        if (!error) {
            if (self.page == 0) {
                [self.dataArr removeAllObjects];
            }
            [self.dataArr addObjectsFromArray:model];
        }
        completionHandle(error);
    }];
}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    self.page = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    if (self.hasMore) {
        self.page += 1;
        [self getDataFromNetCompleteHandle:completionHandle];
    }else
    {
        NSError *err=[NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多数据了"}];
        completionHandle(err);
    }
}
- (BargainingActivityModel *)modelForRowInArray:(NSInteger)row
{
    BargainingActivityModel * model = self.dataArr[row];
    self.maxPageId = model.PageSum;
    return self.dataArr[row];
}
/*
 *获取显示名称
 */
-(NSString *)brandNameForRow:(NSInteger)row
{
    return [self modelForRowInArray:row].BrandName;
}
/*
 *获取红包金额
 */
-(NSString *)moneyForRow:(NSInteger)row{
    return [self modelForRowInArray:row].Money;
}
/*
 *获取是否限量抢
 */
-(NSString *)xlqForRow:(NSInteger)row
{
    return [self modelForRowInArray:row].xlq;
}
/*
 *获取 是否已经抢完
 */
-(NSString *)dayForRow:(NSInteger)row
{
    return [self modelForRowInArray:row].Day;
}
/*
 *获取活动名称
 */
- (NSString *)HdNameForRow:(NSInteger)row
{
    return [self modelForRowInArray:row].HdName;
}
/*
 *获取图片地址
 */
- (NSURL *)imgUrlForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRowInArray:row].Img];
}
/*
 *获取详情链接
 */
- (NSURL *)detailUrlForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRowInArray:row].Url];
}
-(BOOL)isHasMore
{
    return self.maxPageId > self.page;
}
@end
