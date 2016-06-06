//
//  UIImage+Extension.h
//  Demo04_裁切
//
//  Created by tarena on 15/9/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

+(instancetype)imageWithName:(NSString *)name border:(CGFloat)border borderColor:(UIColor *)color;
+(instancetype)imageWithCaptureView:(UIView *)view;
@end
