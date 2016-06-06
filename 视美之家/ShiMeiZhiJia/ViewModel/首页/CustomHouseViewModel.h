//
//  CustomHouseViewModel.h
//  ShiMeiZhiJia
//
//  Created by 孟瑞瑞 on 16/6/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface CustomHouseViewModel : BaseViewModel
/*
 *获取 CustomHouse 图片
 */
- (NSURL *)customHouseImageURL;
/*
 *获取 CustomHouse 详情链接
 */
- (NSURL *)customHouseUrl;
@end
