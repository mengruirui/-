//
//  BargainingActivityViewModel.h
//  ShiMeiZhiJia
//
//  Created by 孟瑞瑞 on 16/6/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface BargainingActivityViewModel : BaseViewModel
/*
 *获取 有多少行
 */
@property (nonatomic) NSInteger rowNumber;
/*
 *获取更多 page
 */
@property (nonatomic) NSInteger page;
/*
 *获取显示名称
 */
-(NSString *)brandNameForRow:(NSInteger)row;
/*
 *获取红包金额

 */
-(NSString *)moneyForRow:(NSInteger)row;
/*
 *获取是否限量抢
 */
-(NSString *)xlqForRow:(NSInteger)row;
/*
 *获取 是否已经抢完
 */
-(NSString *)dayForRow:(NSInteger)row;
/*
 *获取活动名称
 */
- (NSString *)HdNameForRow:(NSInteger)row;
/*
 *获取图片地址
 */
- (NSURL *)imgUrlForRow:(NSInteger)row;
/*
 *获取详情链接
 */
- (NSURL *)detailUrlForRow:(NSInteger)row;
/** 当前最大页数 */
@property(nonatomic) NSInteger maxPageId;
/** 是否有更多页面 */
@property(nonatomic, getter=isHasMore) BOOL hasMore;
@end
