//
//  BannerViewModel.h
//  ShiMeiZhiJia
//
//  Created by 孟瑞瑞 on 16/6/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface BannerViewModel : BaseViewModel
/*
 *获取 banner 图片
 */
- (NSURL *)bannerImageURL;
/*
*获取 banner 详情链接
*/
- (NSURL *)bannerShareUrl;
@end
