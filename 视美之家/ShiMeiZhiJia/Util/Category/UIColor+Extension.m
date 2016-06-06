//
//  UIColor+Extension.m
//  我的微信
//
//  Created by tarena on 15/9/18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)
+(UIColor *)colorWith255Red:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}
+(UIColor *)colorWithHex:(long)hex andAlpha:(CGFloat)alpha
{
    //
    float red = ((float)((hex & 0xFF0000)>>16))/255.0;
    float green = ((float)((hex & 0xFF00)>>8))/255.0;
    float blue = ((float)(hex & 0xFF))/255.0;
  return   [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}
@end
