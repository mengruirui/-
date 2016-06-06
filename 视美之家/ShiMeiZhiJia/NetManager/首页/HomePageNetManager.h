//
//  HomePageNetManager.h
//  ShiMeiZhiJia
//
//  Created by 孟瑞瑞 on 16/6/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

@interface HomePageNetManager : BaseNetManager
//Banner
+ (id)getBannerCompletionHandle:(void(^)(id model,NSError *error))completionHandle;
//定制我家
+ (id)getCustomHouseCompletionHandle:(void(^)(id model,NSError *error))completionHandle;
//砍价活动
+ (id)getBargainingActivityWithPage:(NSInteger)page kCompletionHandle;
@end
